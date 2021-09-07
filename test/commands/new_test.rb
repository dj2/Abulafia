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
        Abulafia::Command::New.handle(@cfg, ['known_name.md'])
        assert @cfg.editor.opened_files.include?('path/known_name.md')
      end

      def test_it_defaults_to_md
        Abulafia::Command::New.handle(@cfg, ['known_name'])
        assert @cfg.editor.opened_files.include?('path/known_name.md')
      end

      def test_it_allows_other_extensions
        Abulafia::Command::New.handle(@cfg, ['known_name.bibtex'])
        assert @cfg.editor.opened_files.include?('path/known_name.bibtex')
      end

      def test_it_creates_default
        Abulafia::Command::New.handle(@cfg, ['known_name.md'])
        assert @cfg.repo.read('known_name.md'),
               "# known_name\n\n\ncreated_at{ 2021-02-13 1425 }"
        assert @cfg.editor.opened_files.include?('path/known_name.md')
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
