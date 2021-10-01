module Validators
  class PostValidator < ActiveModel::Validator
    def validate(record)
      body_or_link(record)
      body_validation(record)
      link_validation(record)
    end

    def body_or_link(record)
      return unless record.body.blank? && record.link.blank?

      record.errors.add :body, 'error, Post must either have a body or a link'
      record.errors.add :link, 'error, Post must either have a body or a link'
    end

    def body_validation(record)
      return unless record.body.blank? && record.link !~ URI::Parser.new.make_regexp(%w[http https])

      record.errors.add :link, 'is invalid'
    end

    def link_validation(record)
      return unless record.link.blank? && !record.body&.size&.between?(10, 750)

      record.errors.add :body, 'must be between 10 and 750 chars'
    end
  end
end
