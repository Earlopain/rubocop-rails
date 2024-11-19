# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Rails::TransactionRescue, :config do
  # TODO: Write test code
  #
  # For example
  it 'registers an offense when using `#bad_method`' do
    expect_offense(<<~RUBY)
      Foo.transaction do
      ^^^^^^^^^^^^^^^^^^ Do not use implicit rescue bodies inside of transactions.
      rescue StandardError
      end
    RUBY
  end

  it 'does not register an offense when using `#good_method`' do
    expect_no_offenses(<<~RUBY)
      Foo.transaction do
        begin
        rescue StandardError
        end
      end
    RUBY
  end
end
