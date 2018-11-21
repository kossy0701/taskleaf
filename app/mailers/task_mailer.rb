class TaskMailer < ApplicationMailer
  default from: 'taskleaf@example.com'

  def creation_email(task)
    @task = taskmail(
      subject: 'タスク完了メール',
      to: 'user@example.com',
      from: 'taskleaf@example.com'
      )
  end
end
