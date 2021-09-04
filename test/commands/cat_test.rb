# frozen_string_literal: true

require 'test_helper'

module Abulafia
  module Command
    class CatTest < Minitest::Test
      def setup
        @cfg = Abulafia::Config.new
        @cfg.term = Test::TermMock.new
        @cfg.repo = Test::RepoMock.new('path')
      end

      def test_it_displays_a_note
        content = 'this is known content'
        @cfg.repo.add('known_name', content)

        Abulafia::Command::Cat.handle(@cfg, ['known_name'])
        assert !@cfg.term.output.empty?
        assert_equal @cfg.term.output, "#{content}\n"
      end

      def test_it_handles_missing_note_name
        err = assert_raises Abulafia::MissingFile do
          Abulafia::Command::Cat.handle(@cfg, [])
        end
        assert_match /name required/, err.message
      end

      def test_it_handles_unknown_note_name
        err = assert_raises Abulafia::NoteDoesNotExist do
          Abulafia::Command::Cat.handle(@cfg, ['unknown_name'])
        end
        assert_match /unable to find/, err.message
      end
    end
  end
end
