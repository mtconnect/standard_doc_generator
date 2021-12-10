#!/usr/bin/env ruby
$: << File.dirname(__FILE__)
# initialize bundler and path
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)
require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])
$: << File.expand_path('../../src', __FILE__)

require 'latexify'
include Kramdown::Converter


(Dir[File.join(MarkdownModel.directory,'*.md')]|
  Dir[File.join(MarkdownModel.directory, 'sections','*.md')]).each do |file|
  MarkdownConverter.generate_latex(file) if !["main.md", "main_flattened.md"].include?(File.basename(file))
end

MtcLatex.reset_labels()