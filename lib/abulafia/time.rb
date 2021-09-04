# frozen_string_literal: true

require 'date'

module Abulafia
  class Time
    STAMP_FORMAT = '%Y%m%d%H%M'

    def stamp
      DateTime.now.strftime(STAMP_FORMAT)
    end
  end
end
