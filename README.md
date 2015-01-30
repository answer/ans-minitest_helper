# Ans::MinitestHelper

minitest 用 helper 集

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ans-minitest_helper'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ans-minitest_helper

## Usage

```ruby
class ModelTest < ActiveSupport::TestCase
  include Ans::MinitestHelper::Model

  it "out of range validation" do
    columns = passed_out_of_range_validation_columns(Model)
    assert{columns == []}
  end
  it "out of range validation" do
    columns = passed_out_of_range_validation_columns(Model,as: {name: "a"*20})
    assert{columns == [:image_path]}
  end

  it "association indexes" do
    columns = no_association_index_columns(Model)
    assert{columns == []}
  end
  it "association indexes" do
    columns = no_association_index_columns(Model,columns: %i{:my_association})
    assert{columns == []}
  end

end
```

### passed_out_of_range_validation_columns(Model)

mysql のカラムの最大長以上の値を投入した場合に validation error にならないカラムを配列にして返す

文字列カラムのみチェックされる

カラム名はシンボルで返される

そのようなカラムが存在しない場合、空の配列が帰る

* as: カラムに対して out_of_range な値を指定する

### no_association_index_columns(Model)

インデックスが存在しない `*_id` のカラムを配列にして返す

そのようなカラムが存在しない場合、空の配列が帰る

* columns: `*_id` 以外のカラムをチェックする場合はカラムをシンボルで列挙する

## Contributing

1. Fork it ( https://github.com/[my-github-username]/ans-minitest_helper/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
