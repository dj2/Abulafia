# frozen_string_literal: true

require 'test_helper'

module Abulafia
  module Command
    class EditTest < Minitest::Test
      def setup
        @cfg = Abulafia::Config.new
        @cfg.editor = Test::EditorMock.new
        @cfg.term = Test::TermMock.new
        @cfg.repo = Test::RepoMock.new('path')
      end

      def test_it_opens_a_note
        @cfg.repo.add('known_name.md', '')

        Abulafia::Command::Edit.handle(@cfg, ['known_name.md'])
        assert @cfg.editor.opened_files.include?('path/known_name.md')
      end

      def test_it_handles_missing_note_name
        err = assert_raises Abulafia::MissingFile do
          Abulafia::Command::Edit.handle(@cfg, [])
        end
        assert_match /name required/, err.message
      end

      def test_it_handles_unknown_note_name
        err = assert_raises Abulafia::NoteDoesNotExist do
          Abulafia::Command::Edit.handle(@cfg, ['unknown_name'])
        end
        assert_match /unable to find/, err.message
      end
    end
  end
end
