function Image(paragraph)
    if paragraph.classes:find('AssoPro',1) then
        local file = io.open("all_collections/_people/" .. paragraph.src, 'r')
        local doc = pandoc.read(file:read('*a')).meta
        file:close()
        local caption = pandoc.utils.stringify(doc.excerpt) or "caption has not been set"
        local title = pandoc.utils.stringify(doc.title) or "title has not been set"
        local md = '### ' .. title .. ' (Αναπληρωτές Καθηγητές)'.. '\n' .. ' - ' ..  caption .. '  \n'
        return pandoc.RawInline('markdown',md)
    end
end



