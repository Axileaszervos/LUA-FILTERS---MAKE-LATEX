function Image(paragraph)
    local string = pandoc.utils.stringify
    if paragraph.classes:find('Medip',1) then
        local file = io.open("all_collections/_people/" .. paragraph.src, 'r')
        local doc = pandoc.read(file:read('*a')).meta
        file:close()
        local caption = string(doc.caption) or "caption has not been set"
        local title = string(doc.title) or "title has not been set"
        local md = '### ' .. title .. ' (Μέλη ΕΔΙΠ)'..'\n_' .. caption .. '_  \n '
        return pandoc.RawInline('markdown',md)
    end
end
