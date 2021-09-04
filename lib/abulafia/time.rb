# frozen_string_literal: true

require 'date'

module Abulafia
  # Provides methods for getting time related information.
  class Time
    STAMP_FORMAT = '%Y%m%d%H%M'

    def stamp
      DateTime.now.strftime(STAMP_FORMAT)
    end
  end
end
