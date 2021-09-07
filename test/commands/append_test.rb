# frozen_string_literal: true

require 'test_helper'

module Abulafia
  module Command
    class AppendTest < Minitest::Test
      def setup
        @cfg = Abulafia::Config.new
        @cfg.term = Test::TermMock.new
        @cfg.repo = Test::RepoMock.new('path')
      end

      def test_it_displays_a_note
        content = "this is known content\n"
        @cfg.repo.add('known_name.md', content)

        Abulafia::Command::Append.handle(@cfg, %w[known_name.md with extra content])
        assert_equal "#{content}with extra content\n",
                     @cfg.repo.read('known_name.md')
      end

      def test_it_handles_missing_note_name
        err = assert_raises Abulafia::MissingFile do
          Abulafia::Command::Append.handle(@cfg, [])
        end
        assert_match /name required/, err.message
      end
    end
  end
end
