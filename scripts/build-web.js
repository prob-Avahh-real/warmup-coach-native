// Minimal build script — just ensures www/ is ready
const fs = require('fs');
const path = require('path');

const wwwDir = path.join(__dirname, '..', 'www');
if (!fs.existsSync(path.join(wwwDir, 'index.html'))) {
  console.error('❌ www/index.html not found');
  process.exit(1);
}

console.log('✅ Web assets ready');
console.log(`   www/index.html (${fs.statSync(path.join(wwwDir, 'index.html')).size} bytes)`);
