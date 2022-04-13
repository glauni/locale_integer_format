# frozen_string_literal: true

require File.expand_path('../lib/locale_integer_format.rb', __FILE__)

Redmine::Plugin.register :locale_integer_format do
  name 'Locale Integer Format plugin'
  author 'benl96'
  description 'Enables input and display of integer custom fields with decimal separator set in locale.'
  version '0.0.3'
  url 'https://github.com/benl96/locale-integer-format'
  author_url 'https://github.com/benl96/locale-integer-format'

  RedmineApp::Application.config.after_initialize do
    #Issue.send(:include, LocaleIntegerFormat::IssuePatch)
    #ApplicationHelper.send(:include, LocaleIntegerFormat::ApplicationHelperPatch)
    Redmine::FieldFormat::IntFormat.include LocaleIntegerFormat::IntegerFormatPatch
  end
end
