# frozen_string_literal: true

require 'test_helper'

module Abulafia
  module Command
    class EditTest < Minitest::Test
      def setup
        @cfg = Abulafia::Config.new
        @cfg.editor = Test::EditorMock.new
      end

      def test_it_opens_a_note
        @cfg.repo = Test::RepoMock.new(['known_name'], 'path')

        Abulafia::Command::Edit.handle(@cfg, ['known_name'])
        assert @cfg.editor.opened_files.include?('path/known_name')
      end

      def test_it_handles_missing_note_name
        @cfg.repo = Test::RepoMock.new([])

        err = assert_raises Abulafia::MissingFile do
          Abulafia::Command::Edit.handle(@cfg, [])
        end
        assert_match /name required/, err.message
      end

      def test_it_handles_unknown_note_name
        @cfg.repo = Test::RepoMock.new([])

        err = assert_raises Abulafia::NoteDoesNotExist do
          Abulafia::Command::Edit.handle(@cfg, ['unknown_name'])
        end
        assert_match /unable to find/, err.message
      end
    end
  end
end
