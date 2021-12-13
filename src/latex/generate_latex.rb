#!/usr/bin/env ruby
$: << File.dirname(__FILE__)
# initialize bundler and path
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)
require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])
$: << File.expand_path('../../src', __FILE__)

require 'latexify'
include Kramdown::Converter

=begin
Generate a LaTeX file for each MD file excluding main.md and main_flattened.md
LaTeX main file and docuemnt class are defined in the model itself. 
Flattened file is not required for LaTeX instead use latexmk to generate .pdf, .ps or .dvi outputs
=end

(Dir[File.join(MarkdownModel.directory,'*.md')]|
  Dir[File.join(MarkdownModel.directory, 'sections','*.md')]).each do |file|
  MarkdownConverter.generate_latex(file) if !["main.md", "main_flattened.md"].include?(File.basename(file))
end

MtcLatex.reset_labels()