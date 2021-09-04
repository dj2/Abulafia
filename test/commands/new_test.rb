# frozen_string_literal: true

require 'test_helper'

module Abulafia
  module Command
    class NewTest < Minitest::Test
      def setup
        @cfg = Abulafia::Config.new
        @cfg.editor = Test::EditorMock.new
        @cfg.term = Test::TermMock.new
        @cfg.repo = Test::RepoMock.new('path')
        @cfg.time = Test::TimeMock.new(DateTime.new(2021, 2, 13, 14, 25))
      end

      def test_it_creates_a_note
        @cfg.repo.add('known_name', '')

        Abulafia::Command::New.handle(@cfg, ['known_name'])
        assert @cfg.editor.opened_files.include?('path/202102131425-known_name.md')
      end

      def test_it_handles_missing_note_name
        err = assert_raises Abulafia::MissingFile do
          Abulafia::Command::New.handle(@cfg, [])
        end
        assert_match /name required/, err.message
      end
    end
  end
end
