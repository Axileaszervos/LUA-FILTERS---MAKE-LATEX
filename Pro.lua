function Image(paragraph)
    if paragraph.classes:find('Pro',1) then
        local file = io.open("all_collections/_people/" .. paragraph.src, 'r')
        local doc = pandoc.read(file:read('*a')).meta
        file:close()
        local caption = pandoc.utils.stringify(doc.excerpt)
        local title = pandoc.utils.stringify(doc.title)
        local md = '### ' .. title .. ' (Καθηγητές)'.. '\n' .. ' - ' ..  caption .. '  \n'
        return pandoc.RawInline('markdown',md)
    end
end
