import std/[strutils, wordwrap]
import httpclient
import re

const
  uri: string = ("https://api.forismatic.com/api/1.0/?" &
                  "method=getQuote&format=text&lang=en")

let
  client = newHttpClient()
  response: string = client.getContent(uri)
  text: seq[string] = response.split('(')
  quoteText: string = text[0].strip.wrapWords(
    maxLineWidth = 60,
    splitLongWords = false,
    newLine = "\n "
  )

echo "\"\e[94m\e[1m" & quoteText & "\e[0m\""

if len(text) > 1:
  echo "\e[93m" & text[1].replace(re"\)", "").strip & "\e[0m"
