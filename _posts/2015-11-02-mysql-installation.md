---
layout: post
title: MySQL Installation
date: 2015-11-02
categories: [computer science]
tags: [data management]

---

# MySQL Installation

<p>설치는 간단하다. <a href="http://dev.mysql.com/downloads/mysql/">MySQL 홈페이지</a>에서 .dmg 파일을 받아서 깔면 된다. 그런데 요세미티로 업그레이드 한 사람들은 그렇게 간단하진 않다! 일단 현재(2014.11월) MySQL 홈페이지에서 제공하는 설치파일이 10.9 버전까지만 있다. 나도 살짝 당황했다. 어랍쇼? 10.10이 없네? 요세미티에선 안되는건가? 혹시나 싶어 10.9 버전을 받아서 설치했더니… 뚜둥! 설치오류<img src="http://i0.wp.com/miconblog.com/wp-content/uploads/2014/11/스크린샷-2014-11-20-오전-1.12.41.png?resize=648%2C330" alt="<img src=" http:="" i0.wp.com="" miconblog.com="" wp-content="" uploads="" 2014="" 11="" 스크린샷-2014-11-20-오전-1.12.41.png?resize="648%2C330&quot;" class="aligncenter size-full wp-image-1664" height="330" width="648">” /&gt; 그래서 나는 요세미티에선 MySQL 안깔린다! 라는 매우 성급한 결론을 내버렸다. 진짜 알깔리는건가? 설마~~ 그럴리가!! 그냥 10.8 버전 설치파일로 깔면 된다. ㅎㅎㅎ 뭐냐? -_-;;;;</p>
<p>이때 설치되는 경로는 아래와 같다.</p>
<pre style="" class="prettyprint prettyprinted"><code><span class="pln">$</span><span class="pun">&gt;</span><span class="pln"> cd </span><span class="pun">/</span><span class="pln">usr</span><span class="pun">/</span><span class="kwd">local</span><span class="pln">
$local</span><span class="pun">&gt;</span><span class="pln"> ls </span><span class="pun">-</span><span class="pln">al
</span><span class="pun">....생략...</span><span class="pln"> mysql </span><span class="pun">-&gt;</span><span class="pln"> mysql</span><span class="pun">-</span><span class="lit">5.6</span><span class="pun">.</span><span class="lit">21</span><span class="pun">-</span><span class="pln">osx10</span><span class="pun">.</span><span class="lit">8</span><span class="pun">-</span><span class="pln">x86_64
</span><span class="pun">....생략...</span><span class="pln"> mysql</span><span class="pun">-</span><span class="lit">5.6</span><span class="pun">.</span><span class="lit">21</span><span class="pun">-</span><span class="pln">osx10</span><span class="pun">.</span><span class="lit">8</span><span class="pun">-</span><span class="pln">x86_64 </span></code></pre>
<p>2015년 5월 덧, 주로 맥환경에서 개발하는 분들을 위해서 추천하는 방법은 위와 같은 방법 말고 그냥 <a href="http://brew.sh">HomeBrew</a>를 설치해서 사용하기를 권장한다. 이번에 새로운 맥프레로 갈아타면서 패키지 관리를 이 HomeBrew를 이용해하고 있는데 너무 편하다. MySQL설치도 그냥 고민없이 아래명령어만 입력하면된다.</p>
<pre style="" class="prettyprint prettyprinted"><code><span class="pln">$</span><span class="pun">&gt;</span><span class="pln"> brew install mysql</span></code></pre>
<p>혹시나 내가 이전에 설치했나? 궁금할때는 brew info 라는 명령어를 이용한다.</p>
<pre style="" class="prettyprint prettyprinted"><code><span class="pln">$</span><span class="pun">&gt;</span><span class="pln"> brew info mysql
mysql</span><span class="pun">:</span><span class="pln"> stable </span><span class="lit">5.6</span><span class="pun">.</span><span class="lit">24</span><span class="pln"> </span><span class="pun">(</span><span class="pln">bottled</span><span class="pun">)</span><span class="pln">
https</span><span class="pun">:</span><span class="com">//dev.mysql.com/doc/refman/5.6/en/</span><span class="pln">
</span><span class="typ">Conflicts</span><span class="pln"> </span><span class="kwd">with</span><span class="pun">:</span><span class="pln"> mariadb</span><span class="pun">,</span><span class="pln"> mysql</span><span class="pun">-</span><span class="pln">cluster</span><span class="pun">,</span><span class="pln"> mysql</span><span class="pun">-</span><span class="pln">connector</span><span class="pun">-</span><span class="pln">c</span><span class="pun">,</span><span class="pln"> percona</span><span class="pun">-</span><span class="pln">server
</span><span class="pun">/</span><span class="pln">usr</span><span class="pun">/</span><span class="kwd">local</span><span class="pun">/</span><span class="typ">Cellar</span><span class="pun">/</span><span class="pln">mysql</span><span class="pun">/</span><span class="lit">5.6</span><span class="pun">.</span><span class="lit">23</span><span class="pln"> </span><span class="pun">(</span><span class="lit">9687</span><span class="pln"> files</span><span class="pun">,</span><span class="pln"> </span><span class="lit">339M</span><span class="pun">)</span><span class="pln"> </span><span class="pun">*</span><span class="pln">
</span><span class="typ">Poured</span><span class="pln"> </span><span class="kwd">from</span><span class="pln"> bottle
</span><span class="pun">..</span><span class="pln"> </span><span class="pun">어쩌구</span><span class="pln"> </span><span class="pun">저쩌구</span><span class="pln"> </span><span class="pun">...</span><span class="pln">
server starting up correctly</span><span class="pun">.</span><span class="pln">

</span><span class="typ">To</span><span class="pln"> connect</span><span class="pun">:</span><span class="pln">
    mysql </span><span class="pun">-</span><span class="pln">uroot

</span><span class="typ">To</span><span class="pln"> have launchd start mysql at login</span><span class="pun">:</span><span class="pln">
    ln </span><span class="pun">-</span><span class="pln">sfv </span><span class="pun">/</span><span class="pln">usr</span><span class="pun">/</span><span class="kwd">local</span><span class="pun">/</span><span class="pln">opt</span><span class="pun">/</span><span class="pln">mysql</span><span class="com">/*.plist ~/Library/LaunchAgents
Then to load mysql now:
    launchctl load ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist
Or, if you don't want/need launchctl, you can just run:
    mysql.server start</span></code></pre>
<p>이전에 HomeBrew로 설치한적이 있다면 위와 같은 정보를 확인할수있다. 나는 mysql을 미리 띄워놓지않고 필요할때만 서버를 띄워서 개발하는 편이라 <strong>mysql.server start</strong> 명령어를 애용하는 편이다. 아래에도 이어서 설명이 나오겠지만 HomeBrew의 강점중에 하나는 /usr/local/Cellar 폴더에 패키지를 설치한후 심볼릭 링크를 알아서 만들어주기 때문에 어디서든 명령어만 입력하면 된다. 즉 아래처럼 설치한 경로를 다 입력하지 않아도 되는 장점이 있다.</p>
<h2>MySQL 서버 실행하기</h2>
<p>리눅스에서 yum으로 mysql을 설치하면 아래와 같이 간단하게 실행할 수 있었다.</p>
<pre style="" class="prettyprint prettyprinted"><code><span class="pln">$</span><span class="pun">&gt;</span><span class="pln"> service mysqld start</span></code></pre>
<p>하지만 맥은 리눅스가 아니다. 그래서 <em>mysql.server</em> 스크립트를 이용한다.</p>
<pre style="" class="prettyprint prettyprinted"><code><span class="pln">$</span><span class="pun">&gt;</span><span class="pln"> </span><span class="str">/usr/</span><span class="kwd">local</span><span class="pun">/</span><span class="pln">mysql</span><span class="pun">/</span><span class="pln">support</span><span class="pun">-</span><span class="pln">files</span><span class="pun">/</span><span class="pln">mysql</span><span class="pun">.</span><span class="pln">server
</span><span class="typ">Usage</span><span class="pun">:</span><span class="pln"> mysql</span><span class="pun">.</span><span class="pln">server  </span><span class="pun">{</span><span class="pln">start</span><span class="pun">|</span><span class="pln">stop</span><span class="pun">|</span><span class="pln">restart</span><span class="pun">|</span><span class="pln">reload</span><span class="pun">|</span><span class="pln">force</span><span class="pun">-</span><span class="pln">reload</span><span class="pun">|</span><span class="pln">status</span><span class="pun">}</span><span class="pln">  </span><span class="pun">[</span><span class="pln"> </span><span class="typ">MySQL</span><span class="pln"> server options </span><span class="pun">]</span><span class="pln">
$</span><span class="pun">&gt;</span><span class="pln"> sudo </span><span class="pun">/</span><span class="pln">usr</span><span class="pun">/</span><span class="kwd">local</span><span class="pun">/</span><span class="pln">mysql</span><span class="pun">/</span><span class="pln">support</span><span class="pun">-</span><span class="pln">files</span><span class="pun">/</span><span class="pln">mysql</span><span class="pun">.</span><span class="pln">server start</span></code></pre>
<h2>MySQL 접속하기</h2>
<p>서버를 실행했다면 이제 mysql 서버에 접속해보자. 보통은 커맨드라인 어디에서든 mysql로 로그인하면 된다. 하지만 그냥 로그인하면 권한이 없는 경우 많다. 그래서 일단 root로 로그인하자. 맥에 처음 mysql을 깔았다면 root는 비밀번호 없이도 로컬에서 접속이 가능할 것이다.</p>
<pre style="" class="prettyprint prettyprinted"><code><span class="pln">$</span><span class="pun">&gt;</span><span class="pln"> mysql </span><span class="pun">-</span><span class="pln">u root  </span><span class="com">// -uroot 라고 붙여서도 된다.</span><span class="pln">
</span><span class="typ">Welcome</span><span class="pln"> to the </span><span class="typ">MySQL</span><span class="pln"> monitor</span><span class="pun">.</span><span class="pln">  </span><span class="typ">Commands</span><span class="pln"> </span><span class="kwd">end</span><span class="pln"> </span><span class="kwd">with</span><span class="pln"> </span><span class="pun">;</span><span class="pln"> </span><span class="kwd">or</span><span class="pln"> \g</span><span class="pun">.</span><span class="pln">
</span><span class="typ">Your</span><span class="pln"> </span><span class="typ">MySQL</span><span class="pln"> connection id </span><span class="kwd">is</span><span class="pln"> </span><span class="lit">528</span><span class="pln">
</span><span class="typ">Server</span><span class="pln"> version</span><span class="pun">:</span><span class="pln"> </span><span class="lit">5.6</span><span class="pun">.</span><span class="lit">21</span><span class="pln"> </span><span class="typ">MySQL</span><span class="pln"> </span><span class="typ">Community</span><span class="pln"> </span><span class="typ">Server</span><span class="pln"> </span><span class="pun">(</span><span class="pln">GPL</span><span class="pun">)</span><span class="pln">
</span><span class="pun">...</span><span class="pln"> </span><span class="pun">중략</span><span class="pln"> </span><span class="pun">...</span><span class="pln">
sql</span><span class="pun">&gt;</span><span class="pln"> </span></code></pre>
<p>위와 같이 나온다면 일단 접속은 성공한거다!</p>
<h2>사용할 DB 만들기</h2>
<p>이제 개발에 필요한 혹은 사용할 데이터베이스를 만들어보자.</p>
<pre style="" class="prettyprint prettyprinted"><code><span class="pln">mysql</span><span class="pun">&gt;</span><span class="pln"> create database testdb</span><span class="pun">;</span><span class="pln">
</span><span class="typ">Query</span><span class="pln"> OK</span><span class="pun">,</span><span class="pln"> </span><span class="lit">1</span><span class="pln"> row affected </span><span class="pun">(</span><span class="lit">0.00</span><span class="pln"> sec</span><span class="pun">)</span></code></pre>
<p>그리고 꼭 캐릭터셋을 확인해야한다. mysql을 설치하고 따로 캐릭터셋(charset)을 따로 설정하지 않았다면 <em>latin1</em> 으로 설정되는데 latin1 캐릭터셋을 쓰면 한글은 당연히 안되고 몇몇 특수문자를 사용할경우 DB에서 입력이 안되는 경우가 허다하다. 그래서 반드시 utf-8로 설정되어 있는지 확인해야한다. 확인하는 방법은 다음과 같다.</p>
<pre style="" class="prettyprint prettyprinted"><code><span class="pln">mysql</span><span class="pun">&gt;</span><span class="pln"> show create database testdb</span><span class="pun">;</span><span class="pln">
</span><span class="pun">+----------+-------------------------------------------------------------------+</span><span class="pln">
</span><span class="pun">|</span><span class="pln"> </span><span class="typ">Database</span><span class="pln"> </span><span class="pun">|</span><span class="pln"> </span><span class="typ">Create</span><span class="pln"> </span><span class="typ">Database</span><span class="pln">                                                   </span><span class="pun">|</span><span class="pln">
</span><span class="pun">+----------+-------------------------------------------------------------------+</span><span class="pln">
</span><span class="pun">|</span><span class="pln"> testdb   </span><span class="pun">|</span><span class="pln"> CREATE DATABASE </span><span class="str">`testdb`</span><span class="pln"> </span><span class="com">/*!40100 DEFAULT CHARACTER SET latin1 */</span><span class="pln"> </span><span class="pun">|</span><span class="pln">
</span><span class="pun">+----------+-------------------------------------------------------------------+</span><span class="pln">
</span><span class="lit">1</span><span class="pln"> row </span><span class="kwd">in</span><span class="pln"> </span><span class="kwd">set</span><span class="pln"> </span><span class="pun">(</span><span class="lit">0.00</span><span class="pln"> sec</span><span class="pun">)</span></code></pre>
<p>젠장 역시나,..-_-;;; latin1으로 되어 있다. 일단 만든건 지우자.</p>
<pre style="" class="prettyprint prettyprinted"><code><span class="pln">mysql</span><span class="pun">&gt;</span><span class="pln"> drop database testdb</span><span class="pun">;</span><span class="pln">
</span><span class="typ">Query</span><span class="pln"> OK</span><span class="pun">,</span><span class="pln"> </span><span class="lit">0</span><span class="pln"> rows affected </span><span class="pun">(</span><span class="lit">0.00</span><span class="pln"> sec</span><span class="pun">)</span></code></pre>
<h2>MySQL 기본 캐릭터셋 설정하기</h2>
<p>MySQL에서 설정파일을 읽는 순서는 다음과 같다.</p>
<ul>
<li>/etc/my.cnf </li>
<li>/etc/mysql/my.cnf </li>
<li>/usr/local/mysql/etc/my.cnf </li>
<li>~/.my.cnf</li>
</ul>
<p>일단 /etc/my.cnf 파일이 있는지 확인하고 없으면 /usr/local/mysql/support-files 폴더에서 my-default.cnf 파일을 복사해온다.</p>
<pre style="" class="prettyprint prettyprinted"><code><span class="pln">$</span><span class="pun">&gt;</span><span class="pln"> cp </span><span class="pun">/</span><span class="pln">usr</span><span class="pun">/</span><span class="kwd">local</span><span class="pun">/</span><span class="pln">mysql</span><span class="pun">/</span><span class="pln">support</span><span class="pun">-</span><span class="pln">files</span><span class="pun">/</span><span class="kwd">my</span><span class="pun">-</span><span class="kwd">default</span><span class="pun">.</span><span class="pln">cnf </span><span class="pun">/</span><span class="pln">etc</span><span class="pun">/</span><span class="kwd">my</span><span class="pun">.</span><span class="pln">cnf</span></code></pre>
<p>그리고 /etc/my.cnf 파일에 다음 내용을 추가한다.</p>
<pre style="" class="prettyprint prettyprinted"><code><span class="pun">[</span><span class="pln">mysqld</span><span class="pun">]</span><span class="pln">
character</span><span class="pun">-</span><span class="kwd">set</span><span class="pun">-</span><span class="pln">server</span><span class="pun">=</span><span class="pln">utf8
collation</span><span class="pun">-</span><span class="pln">server</span><span class="pun">=</span><span class="pln">utf8_general_ci

init_connect</span><span class="pun">=</span><span class="pln">SET collation_connection</span><span class="pun">=</span><span class="pln">utf8_general_ci
init_connect</span><span class="pun">=</span><span class="pln">SET NAMES utf8

</span><span class="pun">[</span><span class="pln">client</span><span class="pun">]</span><span class="pln">
</span><span class="kwd">default</span><span class="pun">-</span><span class="pln">character</span><span class="pun">-</span><span class="kwd">set</span><span class="pun">=</span><span class="pln">utf8

</span><span class="pun">[</span><span class="pln">mysql</span><span class="pun">]</span><span class="pln">
</span><span class="kwd">default</span><span class="pun">-</span><span class="pln">character</span><span class="pun">-</span><span class="kwd">set</span><span class="pun">=</span><span class="pln">utf8</span></code></pre>
<p>이제 다시 서버를 재시작한다. sudo 권한이 없으면 sudo를 붙인다.</p>
<pre style="" class="prettyprint prettyprinted"><code><span class="pln">$</span><span class="pun">&gt;</span><span class="pln"> sudo </span><span class="pun">/</span><span class="pln">usr</span><span class="pun">/</span><span class="kwd">local</span><span class="pun">/</span><span class="pln">mysql</span><span class="pun">/</span><span class="pln">support</span><span class="pun">-</span><span class="pln">files</span><span class="pun">/</span><span class="pln">mysql</span><span class="pun">.</span><span class="pln">server restart</span></code></pre>
<h2>DB 생성 및 생성된 DB 사용자 추가하기</h2>
<p>이제 거의 다왔다. 앞에서 설정한 캐릭터셋이 잘 됐는지 일단 확인하자.</p>
<pre style="" class="prettyprint prettyprinted"><code><span class="pln">mysql</span><span class="pun">&gt;</span><span class="pln"> create database testdb</span><span class="pun">;</span><span class="pln">
</span><span class="typ">Query</span><span class="pln"> OK</span><span class="pun">,</span><span class="pln"> </span><span class="lit">1</span><span class="pln"> row affected </span><span class="pun">(</span><span class="lit">0.00</span><span class="pln"> sec</span><span class="pun">)</span><span class="pln">

mysql</span><span class="pun">&gt;</span><span class="pln"> show create database testdb</span><span class="pun">;</span><span class="pln">
</span><span class="pun">+----------+------------------------------------------------------------------+</span><span class="pln">
</span><span class="pun">|</span><span class="pln"> </span><span class="typ">Database</span><span class="pln"> </span><span class="pun">|</span><span class="pln"> </span><span class="typ">Create</span><span class="pln"> </span><span class="typ">Database</span><span class="pln">                                                  </span><span class="pun">|</span><span class="pln">
</span><span class="pun">+----------+------------------------------------------------------------------+</span><span class="pln">
</span><span class="pun">|</span><span class="pln"> testdb   </span><span class="pun">|</span><span class="pln"> CREATE DATABASE </span><span class="str">`testdb`</span><span class="pln"> </span><span class="com">/*!40100 DEFAULT CHARACTER SET utf-8 */</span><span class="pln"> </span><span class="pun">|</span><span class="pln">
</span><span class="pun">+----------+------------------------------------------------------------------+</span><span class="pln">
</span><span class="lit">1</span><span class="pln"> row </span><span class="kwd">in</span><span class="pln"> </span><span class="kwd">set</span><span class="pln"> </span><span class="pun">(</span><span class="lit">0.00</span><span class="pln"> sec</span><span class="pun">)</span></code></pre>
<p>오예! 잘 됐다. 이제 권한을 추가하자. 권한을 추가하는 방법은 여러가지가 있지만 그냥 쉬운 grant 명령을 이용하자.</p>
<pre style="" class="prettyprint prettyprinted"><code><span class="com">// localhost로 접속만 허용하는 dev 유저 계정 생성</span><span class="pln">
mysql</span><span class="pun">&gt;</span><span class="pln"> grant all privileges on testdb</span><span class="pun">.*</span><span class="pln"> to dev@localhost identified </span><span class="kwd">by</span><span class="pln"> </span><span class="str">'password123'</span><span class="pun">;</span><span class="pln">

</span><span class="com">// 원격 접속도 허용하는 devmaeul 유저 계정 생성 </span><span class="pln">
mysql</span><span class="pun">&gt;</span><span class="pln"> grant all privileges on testdb</span><span class="pun">.*</span><span class="pln"> to dev@</span><span class="str">'%'</span><span class="pln"> identified </span><span class="kwd">by</span><span class="pln"> </span><span class="str">'password123'</span><span class="pun">;</span></code></pre>
<p>dev라는 계정을 만들고 이 계정으로 사용할 testdb도 지정해줬으므로 이제 root가 아닌 dev 계정으로 로그인해서 사용할수있는 DB가 보이는지 확인해보자.</p>
<pre style="" class="prettyprint prettyprinted"><code><span class="pln">$</span><span class="pun">&gt;</span><span class="pln"> mysql </span><span class="pun">-</span><span class="pln">u dev </span><span class="pun">-</span><span class="pln">p
</span><span class="typ">Enter</span><span class="pln"> password</span><span class="pun">:</span><span class="pln"> </span><span class="pun">(앞에서</span><span class="pln"> </span><span class="pun">지정한</span><span class="pln"> </span><span class="pun">패스워드</span><span class="pln"> </span><span class="pun">입력)</span><span class="pln">
</span><span class="pun">...</span><span class="pln"> </span><span class="pun">중략</span><span class="pln"> </span><span class="pun">...</span><span class="pln">
</span><span class="typ">Type</span><span class="pln"> </span><span class="str">'help;'</span><span class="pln"> </span><span class="kwd">or</span><span class="pln"> </span><span class="str">'\h'</span><span class="pln"> </span><span class="kwd">for</span><span class="pln"> help</span><span class="pun">.</span><span class="pln"> </span><span class="typ">Type</span><span class="pln"> </span><span class="str">'\c'</span><span class="pln"> to clear the current input statement</span><span class="pun">.</span><span class="pln">

mysql</span><span class="pun">&gt;</span><span class="pln"> show databases</span><span class="pun">;</span><span class="pln">
</span><span class="pun">+--------------------+</span><span class="pln">
</span><span class="pun">|</span><span class="pln"> </span><span class="typ">Database</span><span class="pln">           </span><span class="pun">|</span><span class="pln">
</span><span class="pun">+--------------------+</span><span class="pln">
</span><span class="pun">|</span><span class="pln"> information_schema </span><span class="pun">|</span><span class="pln">
</span><span class="pun">|</span><span class="pln"> testdb             </span><span class="pun">|</span><span class="pln">
</span><span class="pun">+--------------------+</span><span class="pln">
</span><span class="lit">3</span><span class="pln"> rows </span><span class="kwd">in</span><span class="pln"> </span><span class="kwd">set</span><span class="pln"> </span><span class="pun">(</span><span class="lit">0.00</span><span class="pln"> sec</span><span class="pun">)</span></code></pre>
<p>오예!~ testdb가 보인다! 여기까지 mysql로 개발할때 필요한 기본적인 과정이다.</p>
<h2>타임존 설정 (업데이트 2015-08-31)</h2>
<p>지금까지 기본적인 설정이 끝나서 문제가 없겠구나 했는데 개발하다보니 하나더 발견했다. 바로 타임존이다. 서버에 시간을 기록하는 상황이 아니면 잘 모르기 때문에 사전에 점검하지 않으면 나중에 운영하다 발견하게 된다. 실제로 최근 2달사이 이 문제를 두번 겪었다. 즉, 타임존 설정을 신경써두지 않으면 한국시간으로 오전 10시에 기록을 했는데 서버는 오전 1시로 인식하고 기록하게 된다는 얘기다. 보통 이 문제를 어떻게 해결하는지는 나는 모르겠다. 그냥 상식적으로 생각해보면 글로벌 서비스라면 UTC로 저장하고 한국에서만 서비스할 생각이라면 한국시간에 맞게 저장하는게 좋지않을까? 라고 단순하게만 생각했다. 하지만 그리 단순한 문제는 아니다. 이 얘기 좀금 있다가 다시하고, 여튼 신경쓰지 않았을때 기본값이 어떻게 들어가 있는지 잘 모르기 때문에 일단 현재 시간이 어떻게 저장되어 있는지부터 확인할 필요가 있다!</p>
<pre style="" class="prettyprint prettyprinted"><code><span class="pln">$</span><span class="pun">&gt;</span><span class="pln"> mysql </span><span class="pun">-</span><span class="pln">uroot
mysql</span><span class="pun">&gt;</span><span class="pln"> </span><span class="kwd">select</span><span class="pln"> now</span><span class="pun">();</span><span class="pln">
</span><span class="pun">+---------------------+</span><span class="pln">
</span><span class="pun">|</span><span class="pln"> now</span><span class="pun">()</span><span class="pln">               </span><span class="pun">|</span><span class="pln">
</span><span class="pun">+---------------------+</span><span class="pln">
</span><span class="pun">|</span><span class="pln"> </span><span class="lit">2015</span><span class="pun">-</span><span class="lit">08</span><span class="pun">-</span><span class="lit">31</span><span class="pln"> </span><span class="lit">02</span><span class="pun">:</span><span class="lit">52</span><span class="pun">:</span><span class="lit">24</span><span class="pln"> </span><span class="pun">|</span><span class="pln">
</span><span class="pun">+---------------------+</span><span class="pln">
</span><span class="lit">1</span><span class="pln"> row </span><span class="kwd">in</span><span class="pln"> </span><span class="kwd">set</span><span class="pln"> </span><span class="pun">(</span><span class="lit">0.00</span><span class="pln"> sec</span><span class="pun">)</span></code></pre>
<p>헐퀴! 현재 한국시간은 오전 11시 52분인데 서버는 새벽 2시란다. UTC로 설정되어 있다. 이번엔 내 로컬PC를 확인해봤다. 헐퀴! 이녀석은 또 제대로 나온다. 아~~ 이게 뭐지? 왜 다른거지? 둘다 특별히 설정한건 없는데,… 라는 생각이 들어서 MySQL 공식 문서를 찾아봤다. 에헤라~ 디야~ 그랬쿠나!! OS의 시간을 그대로 가져온다는구나야~~ http://dev.mysql.com/doc/refman/5.6/en/time-zone-support.html</p>
<p>그래서 현재 내PC와 운영중인 AWS 서버의 시간을 확인해봤다.</p>
<pre style="" class="prettyprint prettyprinted"><code><span class="pln">$ AWS</span><span class="pun">&gt;</span><span class="pln"> date
</span><span class="lit">2015.</span><span class="pln"> </span><span class="lit">08.</span><span class="pln"> </span><span class="lit">31.</span><span class="pln"> </span><span class="pun">(월)</span><span class="pln"> </span><span class="lit">03</span><span class="pun">:</span><span class="lit">06</span><span class="pun">:</span><span class="lit">53</span><span class="pln"> UTC

$ </span><span class="kwd">local</span><span class="pun">&gt;</span><span class="pln"> date
</span><span class="lit">2015</span><span class="pun">년</span><span class="pln"> </span><span class="lit">8</span><span class="pun">월</span><span class="pln"> </span><span class="lit">31</span><span class="pun">일</span><span class="pln"> </span><span class="pun">월요일</span><span class="pln"> </span><span class="lit">12</span><span class="pun">시</span><span class="pln"> </span><span class="lit">06</span><span class="pun">분</span><span class="pln"> </span><span class="lit">35</span><span class="pun">초</span><span class="pln"> KST</span></code></pre>
<p>자, 여기서 문제가 발생한다. MYSQL은 기본적으로 OS의 서버 시간을 가지고 설정하기 때문에 단순히 글로벌 서비스라서 UTC로 저장하고 국내용 서비스라서 KST로 저장하면 안되는거다. 왜냐면 서버시간을 물고 들어가기 때문에 서버 위에서 돌아가는 모든 어플리케이션도 영향을 받는다. 따라서 서버시간은 그냥 통일해야하는 문제가 먼저인 것이다. 나는 일단 지금 한국에서 개발하니까 한국시간을 기준으로 설정해야겠다.</p>
<p>그럼 타임존 설정은 어떻게 해야지? 간단하다. /etc/localtime 이라는 파일이 있는데 이 파일 설정을 한국시간으로 바꿔주면 된다. 아래와 같이 심볼릭 링크를 걸어주자!</p>
<pre style="" class="prettyprint prettyprinted"><code><span class="pln">$</span><span class="pun">&gt;</span><span class="pln"> ln </span><span class="pun">-</span><span class="pln">sf </span><span class="pun">/</span><span class="pln">usr</span><span class="pun">/</span><span class="pln">share</span><span class="pun">/</span><span class="pln">zoneinfo</span><span class="pun">/</span><span class="typ">Asia</span><span class="pun">/</span><span class="typ">Seoul</span><span class="pln"> </span><span class="pun">/</span><span class="pln">etc</span><span class="pun">/</span><span class="pln">localtime
$</span><span class="pun">&gt;</span><span class="pln"> ls </span><span class="pun">-</span><span class="pln">al </span><span class="pun">|</span><span class="pln"> grep </span><span class="pun">/</span><span class="pln">etc</span><span class="pun">/</span><span class="pln">locatime
lrwxrwxrwx  </span><span class="lit">1</span><span class="pln"> root root      </span><span class="lit">30</span><span class="pln">  </span><span class="lit">8</span><span class="pun">월</span><span class="pln"> </span><span class="lit">31</span><span class="pln"> </span><span class="lit">12</span><span class="pun">:</span><span class="lit">17</span><span class="pln"> localtime </span><span class="pun">-&gt;</span><span class="pln"> </span><span class="str">/usr/</span><span class="pln">share</span><span class="pun">/</span><span class="pln">zoneinfo</span><span class="pun">/</span><span class="typ">Asia</span><span class="pun">/</span><span class="typ">Seoul</span><span class="pln">
$</span><span class="pun">&gt;</span><span class="pln"> date
</span><span class="lit">2015.</span><span class="pln"> </span><span class="lit">08.</span><span class="pln"> </span><span class="lit">31.</span><span class="pln"> </span><span class="pun">(월)</span><span class="pln"> </span><span class="lit">12</span><span class="pun">:</span><span class="lit">18</span><span class="pun">:</span><span class="lit">08</span><span class="pln"> KST</span></code></pre>
<p>끝~</p>