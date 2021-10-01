module Validators
  class PostValidator < ActiveModel::Validator
    def validate(record)
      if record.body.blank? && record.link.blank?
        record.errors.add :body, 'Post must either have a body or a link'
        record.errors.add :link, 'Post must either have a body or a link'
      end

      if record.body.blank? && record.link !~ URI::Parser.new.make_regexp(%w[http https])
        record.errors.add :link, 'is invalid'
      end

      if record.link.blank? && !record.body&.size&.between?(10, 750)
        record.errors.add :body, 'must be between 10 and 750 chars'
      end
    end
  end
end
