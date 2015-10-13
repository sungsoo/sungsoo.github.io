---
layout: post
title: Sample Data
date: 2015-10-19
categories: [computer science]
tags: [big data, data management]

---

<h1>Sample Data</h1>                

<h2 id="nasa-apache-web-logs">NASA Apache Web Logs</h2>

<p>The sample time-series dataset in <a href="http://indeedeng.github.io/imhotep/files/nasa_19950801.tsv">nasa_19950801.tsv</a> comes from <a href="http://ita.ee.lbl.gov/html/contrib/NASA-HTTP.html">public 1995 NASA Apache web logs</a>. The file contains data for a single day and is in an Imhotep-friendly TSV format.</p>

<p>A Perl script was used to convert the Apache web log into the TSV format, extracting the following fields:</p>

<table><thead>
<tr>
<th></th>
<th></th>
</tr>
</thead><tbody>
<tr>
<td>host</td>
<td>When possible, the hostname making the request. Uses the IP address if the hostname was unavailable.</td>
</tr>
<tr>
<td>logname</td>
<td>Unused, always <code>-</code></td>
</tr>
<tr>
<td>time</td>
<td>In seconds, since 1970</td>
</tr>
<tr>
<td>method</td>
<td>HTTP method: GET, HEAD, or POST</td>
</tr>
<tr>
<td>url</td>
<td>Requested path</td>
</tr>
<tr>
<td>response</td>
<td>HTTP response code</td>
</tr>
<tr>
<td>bytes</td>
<td>Number of bytes in the reply</td>
</tr>
</tbody></table>

<p>Here is an example line (or document) from the dataset:</p>

<pre>piweba3y.prodigy.com - 807301196 GET /shuttle/missions/missions.html 200 8677</pre>

<p>The timestamp <code>807301196</code> is the conversion of <code>01/Aug/1995:13:19:56 -0500</code> using Perl:</p>

<pre>use Date::Parse;
$in = "01/Aug/1995:13:19:56 -0500";
$out = str2time($in);
print "$out\n";</pre>

<p>Data for two months are available in these compressed files:<br>
<a href="http://indeedeng.github.io/imhotep/files/nasa_19950630.22-19950728.12.tsv.gz">nasa_19950630.22-19950728.12.tsv.gz</a><br>
<a href="http://indeedeng.github.io/imhotep/files/nasa_19950731.22-19950831.22.tsv.gz">nasa_19950731.22-19950831.22.tsv.gz</a></p>

<table><thead>
<tr>
<th>TSV Data Size (raw uncompressed)</th>
<th>Imhotep Data Size</th>
</tr>
</thead><tbody>
<tr>
<td>256 MB</td>
<td>19 MB</td>
</tr>
</tbody></table>

<p>Source: <a href="http://ita.ee.lbl.gov/html/contrib/NASA-HTTP.html">Internet Traffic Archive</a></p>

<h2 id="wikipedia-web-logs">Wikipedia Web Logs</h2>

<p>The time-series data in <a href="http://indeedeng.github.io/imhotep/files/wikipedia_e_20140913.11.tsv.gz">wikipedia_e_20140913.11.tsv.gz</a> is one hour of data from 9/13/2014 for Wikipedia articles beginning with the letter E. </p>

<p>Each document corresponds to a Wikipedia article that was served in that hour:</p>

<table><thead>
<tr>
<th></th>
<th></th>
</tr>
</thead><tbody>
<tr>
<td>title</td>
<td>Title of the article on Wikipedia</td>
</tr>
<tr>
<td>categories+</td>
<td>List of categories in which the article is contained</td>
</tr>
<tr>
<td>titleWords+</td>
<td>List of words in the title</td>
</tr>
<tr>
<td>linksOut+</td>
<td>List of Wikipedia articles linked by the article</td>
</tr>
<tr>
<td>numRequests</td>
<td>Number of requests for the article in that hour</td>
</tr>
<tr>
<td>bytesServed</td>
<td>Number of bytes served for the article in that hour</td>
</tr>
</tbody></table>

<p><a href="http://54.214.252.202/iql/#q%5B%5D=from+wikipedia+%222014-09-13+11%3A00%3A00%22+%222014-09-13+12%3A00%3A00%22+where+title%3D%7E%22E.*%22+group+by+title%5B10+by+numRequests%5D+select+numRequests&amp;view=table&amp;table_sort%5B0%5D%5B%5D=2&amp;table_sort%5B0%5D%5B%5D=desc">The most popular E entry</a> in that hour was <code>English_alphabet</code>.</p>

<table><thead>
<tr>
<th>title</th>
<th>categories+</th>
<th>titleWords+</th>
<th>linksOut+</th>
<th>numRequests</th>
<th>bytesServed</th>
</tr>
</thead><tbody>
<tr>
<td><span class="smallcode"><code>English_alphabet</code></span></td>
<td><span class="xscode"><code>All_Wikipedia_articles_needing_clarification All_articles_needing_additional_references All_articles_with_unsourced_statements Articles_containing_Old_English-language_text Articles_needing_additional_references_from_June_2011 Articles_with_hAudio_microformats Articles_with_unsourced_statements_from_January_2011 Articles_with_unsourced_statements_from_July_2010 Articles_with_unsourced_statements_from_March_2014 English_spelling Latin_alphabets Wikipedia_articles_needing_clarification_from_August_2013</code></span></td>
<td><span class="smallcode"><code>English alphabet</code></span></td>
<td><span class="xscode"><a href="http://demo.imhotep.works/iql/#q[]=from+wikipedia+%222014-09-13+11%3A00%3A00%22+%222014-09-13+12%3A00%3A00%22+where+title%3D%22English_alphabet%22+group+by+linksOut&amp;view=table&amp;table_sort[0][]=2&amp;table_sort[0][]=desc"><code>A Adjective Aircraft Alphabet_song American_English American_braille American_manual_alphabet Ampersand Anglo-Saxon_futhorc Anglo-Saxons Ansuz_(rune) Apostrophe B Body_cavity British_English Byrhtfert ...</code></a></span></td>
<td><span class="smallcode"><code>960</code></span></td>
<td><span class="smallcode"><code>21124206</code></span></td>
</tr>
</tbody></table>

<table><thead>
<tr>
<th>TSV Data Size (raw uncompressed)</th>
<th>Imhotep Data Size</th>
</tr>
</thead><tbody>
<tr>
<td>2450 GB</td>
<td>272 GB</td>
</tr>
</tbody></table>

<p>Source: <a href="https://dumps.wikimedia.org/other/pagecounts-raw/">https://dumps.wikimedia.org/other/pagecounts-raw/</a> for page counts and <a href="https://dumps.wikimedia.org/backup-index.html">https://dumps.wikimedia.org/backup-index.html</a> for all other fields</p>

<h2 id="world-cup-2014-player-data">World Cup 2014 Player Data</h2>

<p>The dataset in <a href="http://indeedeng.github.io/imhotep/files/worldcupplayerinfo_20140701.tsv">worldcupplayerinfo_20140701.tsv</a> includes information about players in the World Cup 2014. Since this is not typical time-series Imhotep data, all documents are assigned the same timestamp: <code>2014-07-01 00:00:00</code></p>

<p>Each document in the dataset includes information about a single player:</p>

<table><thead>
<tr>
<th></th>
<th></th>
<th></th>
</tr>
</thead><tbody>
<tr>
<td>Player</td>
<td>String</td>
<td>Player’s name.</td>
</tr>
<tr>
<td>Age</td>
<td>Int</td>
<td>Player’s age.</td>
</tr>
<tr>
<td>Captain</td>
<td>Int</td>
<td>Value (1 or 0) indicates whether the player is a captain.</td>
</tr>
<tr>
<td>Club</td>
<td>String</td>
<td>The player’s club when not playing for the national team in the World Cup.</td>
</tr>
<tr>
<td>Country</td>
<td>String</td>
<td>The country the player represents in the World Cup.</td>
</tr>
<tr>
<td>Group</td>
<td>String</td>
<td>The player’s national team belongs to this World Cup group.</td>
</tr>
<tr>
<td>Jersey</td>
<td>Int</td>
<td>The player’s jersey number.</td>
</tr>
<tr>
<td>Position</td>
<td>String</td>
<td>The player’s position.</td>
</tr>
<tr>
<td>Rank</td>
<td>Int</td>
<td>The ranking of the country the player represents.</td>
</tr>
<tr>
<td>Selections</td>
<td>Int</td>
<td>The number of World Cup appearances for this player.</td>
</tr>
</tbody></table>

<table><thead>
<tr>
<th>TSV Data Size (raw uncompressed)</th>
<th>Imhotep Data Size</th>
</tr>
</thead><tbody>
<tr>
<td>45 KB</td>
<td>15 KB</td>
</tr>
</tbody></table>

<p>Source: <a href="http://opendata.stackexchange.com/questions/1791/any-open-data-sets-for-the-football-world-cup-in-brazil-2014">Stack Exchange Network</a> / Open Data<br>
The data are distributed under the creative commons <a href="http://creativecommons.org/licenses/by-sa/4.0/">Attribution-Share Alike 4.0 International</a> license. The creator of the data is <a href="http://opendata.stackexchange.com/users/3061/bryan">http://opendata.stackexchange.com/users/3061/bryan</a>. In compliance with this license, the data is hereby attributed to the users and owners of StackOverflow, but not in such a way as to suggest that they endorse Indeed or Indeed’s use of the data.</p>