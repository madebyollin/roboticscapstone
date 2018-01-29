#!/usr/bin/env bash
set -e

bold=`tput bold`
red=`tput setaf 1`
blue=`tput setaf 4`
endc=`tput sgr0`
print () { echo -e "$bold$bblue$1$endc" ;}

content_dir="posts"
template_dir="posts/_template"

print "post_short_name (e.g. a1p1):"
read short_name
print "Post Proper Title (e.g. Blog Post #1 Part 1):"
read proper_title
print "Subtitle (e.g. Project Proposal Critiques):"
read subtitle

post_path="$content_dir/$short_name"
mkdir -p "$post_path"

cp "$template_dir"/* "$post_path"

# Hard-coded stream replacements
sed -i '' "s|{{TITLE}}|$proper_title|" "$post_path/index.html"
sed -i '' "s|{{SUBTITLE}}|$subtitle|" "$post_path/index.html"
tag="<li><a href=\"/$post_path\">$proper_title: <span class=\"subtitle\">$subtitle</span></a></li>"
sed -i '' "s|<!--{{NEWPOST}}-->|<!--{{NEWPOST}}-->$tag|" "index.html"
