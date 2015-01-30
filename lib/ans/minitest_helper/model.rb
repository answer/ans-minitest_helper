module Ans::MinitestHelper::Model
  def passed_out_of_range_validation_columns(model,as: {})
    model.columns.map{|column|
      out_of_range_value = as[column.name.to_sym] || case column.type
      when :string
        "a"*(column.limit+1)
      end
      if out_of_range_value
        if model.new(column.name => out_of_range_value).valid?
          column.name.to_sym
        end
      end
    }.compact
  end

  def no_association_index_columns(model,columns: [])
    indexes = model.connection.indexes(model.table_name)
    model.columns.map{|column|
      column_name = column.name.to_s
      case column_name.to_sym
      when /_id$/, *columns
        unless indexes.any?{|index| index.columns == [column_name]}
          column_name.to_sym
        end
      end
    }.compact
  end
end
