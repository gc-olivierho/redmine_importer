# Patch ActionMailer to disable notifications of issue changes if
# Thread.current[:bulk_import_disable_notifications] = true

module MailNotifications
  class MailInterceptor

    def self.delivering_email(mail)
      mail ||= instance_variable_get(:@mail)
      if (Thread.current[:bulk_import_disable_notifications])
        mail.perform_deliveries = false
        Rails.logger.info("Bulk import cancelled mail: #{mail.subject}")
      end
    end

    if (!ActionMailer::Base::Mail.class_variable_get(:@@delivery_interceptors).nil?)
      ::ActionMailer::Base.register_interceptor(self)
    else
      ::ActionMailer::Base.register_interceptor([ActionMailer::Base::Mail.class_variable_get(:@@delivery_interceptors), self])
    end
  end

end

