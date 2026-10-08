const fs = require('fs');
const path = require('path');

const root = path.join(__dirname, '..');
const www = path.join(root, 'www');
const index = path.join(www, 'index.html');

if (!fs.existsSync(index)) {
  console.error('❌ www/index.html not found');
  process.exit(1);
}

console.log(`✅ Web assets ready (${fs.statSync(index).size} bytes)`);
