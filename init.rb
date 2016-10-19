# encoding: UTF-8

require 'redmine'
require 'action_mailer_mail_interceptor'

Redmine::Plugin.register :redmine_importer do
  name 'Issue Importer'
  author 'Martin Liu / Leo Hourvitz / Stoyan Zhekov / Jérôme Bataille / Olivier Houdas'
  description 'Issue import plugin for Redmine.'
  version '1.4.2'

# Add Import tab access permission in the project permissions
  permission :import, :importer => :index
  menu :project_menu, :importer, { :controller => 'importer', :action => 'index' }, :caption => :label_import, :before => :settings, :param => :project_id
end
