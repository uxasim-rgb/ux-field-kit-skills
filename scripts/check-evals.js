// Static validation of the eval suite. No API calls, no cost.
const fs = require('fs');
const path = require('path');

const ROOT = path.resolve(__dirname, '..');
const EVALS = path.join(ROOT, 'evals');
const SKILLS = path.join(ROOT, 'skills');

let fail = 0;
const err = (m) => { console.log('  FAIL ' + m); fail++; };

// --- collect cases ---
function findCases(dir) {
  const out = [];
  for (const e of fs.readdirSync(dir, { withFileTypes: true })) {
    if (!e.isDirectory()) continue;
    const p = path.join(dir, e.name);
    if (fs.existsSync(path.join(p, 'prompt.md'))) out.push(p);
    else out.push(...findCases(p));
  }
  return out;
}
const cases = findCases(EVALS);
const skills = fs.readdirSync(SKILLS).filter(d =>
  fs.existsSync(path.join(SKILLS, d, 'SKILL.md')));

console.log(`cases: ${cases.length}   skills: ${skills.length}\n`);

// --- 1. frontmatter parses on every prompt and grader ---
console.log('1. YAML frontmatter delimiters');
for (const c of cases) {
  const files = [path.join(c, 'prompt.md'),
    ...fs.readdirSync(path.join(c, 'graders')).map(f => path.join(c, 'graders', f))];
  for (const f of files) {
    const txt = fs.readFileSync(f, 'utf8');
    if (!txt.startsWith('---\n')) err(`${f} does not open with ---`);
    const end = txt.indexOf('\n---\n', 3);
    if (end === -1) err(`${f} has no closing ---`);
  }
}
if (!fail) console.log('  ok');

// --- 2. skill-fired regexes actually match a real Skill tool input ---
console.log('\n2. skill-fired input_match against realistic tool inputs');
let regexChecked = 0;
for (const c of cases) {
  const gdir = path.join(c, 'graders');
  for (const g of fs.readdirSync(gdir)) {
    const txt = fs.readFileSync(path.join(gdir, g), 'utf8');
    const m = txt.match(/^input_match:\s*'(.+)'\s*$/m);
    if (!m) continue;
    const pattern = m[1];
    let re;
    try { re = new RegExp(pattern); }
    catch (e) { err(`${path.join(c, g)} invalid regex: ${e.message}`); continue; }

    // the slug this pattern targets
    const slugM = pattern.match(/\)\?([a-z-]+)"/);
    if (!slugM) { err(`${path.join(c, g)} cannot extract slug from pattern`); continue; }
    const slug = slugM[1];

    // what Claude Code actually sends for a Skill call, both forms
    const bare = JSON.stringify({ skill: slug });
    const namespaced = JSON.stringify({ skill: `ux-field-kit:${slug}` });
    const spaced = `{"skill" : "${slug}"}`;
    const other = JSON.stringify({ skill: 'ux-field-kit:typography' });

    if (!re.test(bare)) err(`${slug}: does not match bare form ${bare}`);
    if (!re.test(namespaced)) err(`${slug}: does not match namespaced form ${namespaced}`);
    if (!re.test(spaced)) err(`${slug}: does not match whitespace form`);
    if (slug !== 'typography' && re.test(other)) err(`${slug}: WRONGLY matches a different skill`);
    regexChecked++;
  }
}
console.log(`  checked ${regexChecked} regexes`);
if (!fail) console.log('  ok');

// --- 3. every skill has a trigger case ---
console.log('\n3. every skill has a case');
for (const s of skills) {
  if (!fs.existsSync(path.join(EVALS, s, 'prompt.md'))) err(`no eval case for skill '${s}'`);
}
console.log('  ok if nothing above');

// --- 4. prompts do not name their own skill (defeats the test) ---
console.log('\n4. prompts do not leak the skill name');
const slashAllowed = ['prototyping', 'review-the-change', 'design-critique', 'case-studies'];
for (const s of skills) {
  const p = path.join(EVALS, s, 'prompt.md');
  if (!fs.existsSync(p)) continue;
  const body = fs.readFileSync(p, 'utf8').split(/\n---\n/).slice(1).join('\n---\n');
  if (body.includes(s) && !slashAllowed.includes(s)) {
    err(`${s}: prompt contains its own skill name — Claude can pattern-match instead of choosing`);
  }
}
console.log('  ok if nothing above');

// --- 5. routing cases target two different skills ---
console.log('\n5. routing cases name a real owner and a real neighbour');
const rdir = path.join(EVALS, 'routing');
if (fs.existsSync(rdir)) {
  for (const r of fs.readdirSync(rdir)) {
    const gdir = path.join(rdir, r, 'graders');
    const slugs = [];
    for (const g of fs.readdirSync(gdir)) {
      const t = fs.readFileSync(path.join(gdir, g), 'utf8');
      const m = t.match(/\)\?([a-z-]+)"/);
      if (m) slugs.push(m[1]);
    }
    for (const s of slugs) if (!skills.includes(s)) err(`routing/${r} references unknown skill '${s}'`);
    if (new Set(slugs).size !== 2) err(`routing/${r} should name exactly 2 distinct skills, found ${slugs.length}`);
  }
}
console.log('  ok if nothing above');

// --- 6. every case has at least one grader ---
console.log('\n6. every case has graders');
for (const c of cases) {
  const g = path.join(c, 'graders');
  if (!fs.existsSync(g) || fs.readdirSync(g).length === 0) err(`${c} has no graders`);
}
console.log('  ok if nothing above');

console.log(`\n${'='.repeat(50)}`);
console.log(fail === 0 ? 'ALL STATIC CHECKS PASSED' : `${fail} FAILURE(S)`);
process.exit(fail === 0 ? 0 : 1);
