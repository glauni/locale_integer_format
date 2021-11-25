module LocaleIntegerFormat
  module IntegerFormatPatch
    def self.included(base)
      base.class_eval do
        def set_custom_field_value(custom_field, custom_field_value, value)
          delimiter = I18n.t('number.format.delimiter', default: ',')
          separator = I18n.t('number.format.separator', default: '.')
          value&.tr(delimiter, '')&.tr(separator, '.')
        end

        def edit_tag(view, tag_id, tag_name, custom_value, options={})
          view.text_field_tag(tag_name, ApplicationController.helpers.number_with_delimiter(custom_value.value), options.merge(:id => tag_id))
        end
      end
    end
  end
end
