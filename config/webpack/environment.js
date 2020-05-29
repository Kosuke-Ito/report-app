const { environment } = require('@rails/webpacker')

// デフォルトのセッティングでいいならこの行を足すだけで有効になる。
environment.splitChunks()

module.exports = environment
