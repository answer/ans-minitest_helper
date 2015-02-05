module Ans::MinitestHelper::Model
  def passed_out_of_range_validation_columns(model,as: {})
    model.columns.map{|column|
      column_name = column.name.to_sym
      out_of_range_value = as[column_name] || case column.type
      when :string
        "a"*(column.limit+1)
      end
      if out_of_range_value
        instance = model.new(column_name => out_of_range_value)
        if instance.valid? || instance.errors[column_name].blank?
          column_name
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
