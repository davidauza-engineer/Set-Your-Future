desc 'run the linters on the appropriate context'

namespace :lint do
  task ruby: :environment do
    sh 'rubocop'
  end

  task scss: :environment do
    sh 'npx stylelint app/assets/stylesheets'
  end

  task javascript: :environment do
    sh 'npx eslint app/javascript'
    sh 'npx eslint stylelint.config.js'
  end
end
