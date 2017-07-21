local alphabet = {}

alphabet.ranges = {
  Latin={{0x0020,0x007F},{0x00A0,0x00FF},{0x0100,0x017F},{0x0180,0x024F}},
  Braille={{0x2800,0x28FF}},
  Greek={{0x0370,0x03FF}},
  Cyrillic={{0x0400,0x04FF},{0x0500,0x052F}},
  Armenian={{0x0530,0x058F}},
  Hebrew={{0x0590,0x05FF}},
  Arabic={{0x0600,0x06FF},{0xFB50,0xFDFF},{0xFE70,0xFEFF}},
  Kangxi={{0x2F00,0x2FDF}},
  Syriac={{0x0700,0x074F}},
  Thaana={{0x0780,0x07BF}},
  Devanagari={{0x0900,0x097F}},
  Hiragana={{0x3040,0x309F}},
  Bengali={{0x0980,0x09FF}},
  Katakana={{0x30A0,0x30FF},{0x31F0,0x31FF}},
  Gurmukhi={{0x0A00,0x0A7F}},
  Bopomofo={{0x3100,0x312F},{0x31A0,0x31BF}},
  Gujarati={{0x0A80,0x0AFF}},
  Hangul={{0x3130,0x318F},{0xAC00,0xD7AF},{0x1100,0x11FF}},
  Oriya={{0x0B00,0x0B7F}},
  Kanbun={{0x3190,0x319F}},
  Tamil={{0x0B80,0x0BFF}},
  Telugu={{0x0C00,0x0C7F}},
  Kannada={{0x0C80,0x0CFF}},
  Malayalam={{0x0D00,0x0D7F}},
  Sinhala={{0x0D80,0x0DFF}},
  Thai={{0x0E00,0x0E7F}},
  Lao={{0x0E80,0x0EFF}},
  Han={{0x2E80,0x2EFF},{0x3200,0x32FF},{0x3300,0x33FF},{0x3400,0x4DBF},{0x4E00,0x9FFF},{0xF900,0xFAFF},{0xFE30,0xFE4F}},
  Tibetan={{0x0F00,0x0FFF}},
  Yi={{0xA000,0xA48F},{0xA490,0xA4CF}},
  Myanmar={{0x1000,0x109F}},
  Georgian={{0x10A0,0x10FF}},
  Ethiopic={{0x1200,0x137F}},
  Cherokee={{0x13A0,0x13FF}},
  Ogham={{0x1680,0x169F}},
  Tagalog={{0x1700,0x171F}},
  Hanunoo={{0x1720,0x173F}},
  Buhid={{0x1740,0x175F}},
  Tagbanwa={{0x1760,0x177F}},
  Khmer={{0x1780,0x17FF}},
  Mongolian={{0x1800,0x18AF}},
  Limbu={{0x1900,0x194F}}
}

local alphabet_revmap = {}
function alphabet.findAlphabet(v)
  if #alphabet_revmap == 0 then
    for a, ranges in pairs(alphabet.ranges) do
      for _, r in ipairs(ranges) do
        table.insert(alphabet_revmap, {r[1], r[2], a})
      end
    end
    table.sort(alphabet_revmap, function(a,b) return a[1]<b[1] end)
  end
  local b=1
  local e=#alphabet_revmap
  while b < e do
    local m = math.floor((b+e)/2)
    if alphabet_revmap[m][1]<=v and v<=alphabet_revmap[m][2] then
      return alphabet_revmap[m][3]
    end
    if alphabet_revmap[m][1] > v then
      e = m - 1
    else
      b = m + 1
    end
  end
  if alphabet_revmap[b][1]<=v and v<=alphabet_revmap[b][2] then
    return alphabet_revmap[b][3]
  end
  return
end

return alphabet
