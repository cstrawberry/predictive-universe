-- Keep at least two body rows together at either end of a multipage table.
-- Pandoc still writes every cell and the repeated header; only the permitted
-- page-break positions change. Short tables (up to four rows) stay together.
-- Keep the final rule with the final row, avoiding an empty continuation head.
function Header(heading)
  if not FORMAT:match('latex') or heading.identifier == '' then return nil end
  local target = heading.identifier
  assert(target:match('^[%w_%-]+$'), 'Unsafe heading destination')
  heading.identifier = ''
  -- Put the destination inside the heading's typeset text. An outer
  -- hypertarget can be left behind when LaTeX moves the heading to a new page.
  heading.content:insert(1, pandoc.RawInline('latex',
    '\\texorpdfstring{\\protect\\raisebox{\\baselineskip}[0pt][0pt]{\\protect\\hypertarget{' .. target .. '}{}}}{}'))
  local latex = pandoc.write(pandoc.Pandoc({heading}), 'latex')
  return pandoc.RawBlock('latex', latex .. '\\label{' .. target .. '}')
end

function Table(tbl)
  if not FORMAT:match('latex') then return nil end
  local row_count = 0
  for _, body in ipairs(tbl.bodies) do
    row_count = row_count + #body.head + #body.body
  end
  local latex = pandoc.write(pandoc.Pandoc({tbl}), 'latex')
  -- Reserve the same footer height on every page. Without an ordinary footer,
  -- longtable can fill the page with rows and push only its final rule onto a
  -- new page, even when the last row uses a protected line break.
  local final_footer = '\\bottomrule\\noalign{}\n\\endlastfoot'
  local footer_start, footer_last = assert(latex:find(final_footer, 1, true))
  latex = latex:sub(1, footer_start - 1) ..
    '\\bottomrule\\noalign{}\n\\endfoot\n' .. final_footer .. latex:sub(footer_last + 1)
  local footer_end = assert(latex:find('\\endlastfoot', 1, true),
    'Expected the longtable footer before its body')
  local prefix = latex:sub(1, footer_end + #'\\endlastfoot' - 1)
  local body = latex:sub(footer_end + #'\\endlastfoot')
  local row_end = ' ' .. string.rep('\\', 2) .. '\n'
  local protected_end = ' ' .. string.rep('\\', 2) .. '*\n'
  local pieces, position, row = {}, 1, 0
  while true do
    local first, last = body:find(row_end, position, true)
    if not first then break end
    row = row + 1
    pieces[#pieces + 1] = body:sub(position, first - 1)
    local protect = row_count <= 4 or row == 1 or row >= row_count - 1
    pieces[#pieces + 1] = protect and protected_end or row_end
    position = last + 1
  end
  assert(row == row_count, 'Unexpected LaTeX table row boundaries')
  pieces[#pieces + 1] = body:sub(position)
  return pandoc.RawBlock('latex', prefix .. table.concat(pieces))
end
