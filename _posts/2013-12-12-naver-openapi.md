---
layout: post
title: Android WebView Application using Naver Open API
date: 2013-12-12
categories: [computer science]
tags: [design patterns]

---

###네이버 계정으로 Open API 접속

네이버의 Open API 를 사용하여 뉴스, 이미지, 블로그 등등을 조회하기 위해서는 우선 Naver 에 회원가입이 되어있어야 하고, 네이버에 로그인을 해야 한다.
Open API 는 누구든지 key 를 발급 받으면 사용할 수 있으며, 일일동안에 접속하는 데이터량의 제한이 있다.
아래 이미지는 네이버 개발자 센터 홈페이지이다.

![http://sungsoo.github.com/images/naver-openapi.png](http://sungsoo.github.com/images/naver-openapi.png)

###Open API 확인

위 이미지에서 검색 API 메뉴를 클릭하면 검색 API 목록이 나온다. 검색 API 목록 중에서 이번 예제에서는 News 와 Image 목록을 안드로이드에서 조회하는 어플리케이션을 작성하려고 한다.
우선 검색을 하기 위해서는 네이버 개발사 사이트에서 키를 발급받아야 한다. 키를 발급받는 링크는 왼쪽 메뉴에 “키 등록/관리” 메뉴를 클릭한다.
검색 API 에 대한 key 와 지도 API key 두 가지 형태의 key 를 발급받을 수 있으며, 지도 API key 를 사용하고자 한다면, “키 추가” 버튼을 클릭하여 키를 추가한다.
아래 화면은 키 등록/관리를 통해 발급 받은 내역이다.

![http://sungsoo.github.com/images/openapi-key.png](http://sungsoo.github.com/images/openapi-key.png)

###Open API 테스트
다시 검색 API 메뉴를 선택하고, “뉴스” 항목을 선택하면, “뉴스 검색”에 대한 요청 URL 과 요청변수, 그리고 출력결과 필드의 정보를 확인할 수 있다. 샘플 URL 에서 나타낸 URL 과 key 를 사용하여 브라우저에서 뉴스를 검색해 본다.
다음은 뉴스 검색 안내 페이지이다.

![http://sungsoo.github.com/images/openapi-key.png](http://sungsoo.github.com/images/openapi-key.png)


그리고 샘플 URL 과 Key 를 사용하여 검색하면, 아래와 같이 RSS Feed 형태의 XML 데이터를 브라우저에서 확인할 수 있다.

![http://sungsoo.github.com/images/search-news.png](http://sungsoo.github.com/images/search-news.png)

이 XML 문서를 Parsing 하여 Andorid Application 에서 목록(ListView)으로 보여주려고 한다.


![http://sungsoo.github.com/images/sample-search.png](http://sungsoo.github.com/images/sample-search.png)

###XML Parsing


Android 에서는 XML Parsing 하는데 있어, 크게 3 가지 형태를 사용하고 있다. 
* SAX Parser 사용
* XMLPullParser 사용
* DOM Parser 사용
이번 예제에서는 이 세가지 방법을 모두 다뤄볼 것이며, 각각의 방식으로 XML Parsing 하는 소스코드도 함께 작성 할 것이다.


###Android Project 생성
우선 Project 를 먼저 생성하여, Application 을 개발하기 위한 초기 작업을 수행한다.
Eclipse 를 실행하고, File -> New -> Android Project 메뉴를 선택한다.
* Project name : NaverApi
* Build Target : Android 2.3.3
* Package : nscreen.searchinfo

![http://sungsoo.github.com/images/android-project.png](http://sungsoo.github.com/images/android-project.png)


Finish 버튼을 클릭하여 Project 를 생성한다.

####News 클래스 생성

하나의 News 를 저장하는 News 클래스를 생성한다. Open API 를 사용하여, XML 데이터를 Parsing 하게 되면, 각각의 News 의 정보를 저장하기 위한 객체가 필요하다. 하나의 News 를 저장하기 위한 객체를 만들기 위해서 News 라는 이름의 클래스를 생성한다. 이 클래스에는 Naver 에서 News 의 정보를 제공해주는 각 항목을 저장하기 위한 멤버변수가 존재하게 된다. 

위의 XML 데이터에서 확인했듯이, 하나의 News 에 대한 여러가지 내용을 저장하기 위한 멤버변수를 정의한다.  Title, Link, OriginalLink, Date 등이 기본적으로 저장된다.
따라서 아래와 같이 News 클래스를 생성한다.

```
package nscreen.searchinfo.news;

import java.net.MalformedURLException;
import java.net.URL;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
public class News implements Comparable<News> {
        static final String CHANNEL = "channel";
    static final String PUB_DATE = "pubDate";
    static final String DESCRIPTION = "description";
    static final String LINK = "link";
    static final String ORIGINAL_LINK = "originallink";
    static final String TITLE = "title";
    static final String ITEM = "item";
   
        static SimpleDateFormat FORMATTER =
                        new SimpleDateFormat("EEE, dd MMM yyyy HH:mm:ss Z");
        static SimpleDateFormat FORMATTER_KR =
                        new SimpleDateFormat("yyyy년 MM월 dd일 HH시mm분ss초, E");
        private String title;
        private URL link;
        private URL originalLink;
        private String description;
        private Date date;
        public String getTitle() {
                return title;
        }
        public void setTitle(String title) {
                this.title = title;
        }
        public URL getLink() {
                return link;
        }
        public String getDescription() {
                return description;
        }
        public void setDescription(String description) {
                this.description = description;
        }
        public void setLink(String link) {
                try {
                        if (link != null  && link.trim().length() > 0) {
                                this.link = new URL("link);
                        }
                } catch (MalformedURLException e) {
                        throw new RuntimeException(e);
                }
        }
        
        public URL getOriginalLink() {
                return originalLink;
        }
        public void setOriginalLink(String originalLink) {
                try {
                        if (originalLink != null && originalLink.trim().length() > 0) {
                                this.originalLink = new URL("originalLink);
                        }
                } catch (MalformedURLException e) {
                        throw new RuntimeException(e);
                }
        }
        public String getDate() {
                return FORMATTER_KR.format(this.date);
        }
        public void setDate(String date) {
                while (!date.endsWith("00")){
                        date += "0";
                }
                try {
                        this.date = FORMATTER.parse(date.trim());
                } catch (ParseException e) {
                        throw new RuntimeException(e);
                }
        }
        public int compareTo(News another) {
                if (another == null) return 1;
                return another.date.compareTo(date);
        }
        
        public News copy() {
                
                News news = new News();
                news.date = this.date;
                news.description = this.description;
                news.link = this.link;
                news.originalLink = this.originalLink;
                news.title = this.title;
                
                return news;
        }
}
```

####XML Parsing 클래스 생성
XML 데이터를 Pasring 하기 위한 interface와 공통 기능을 위한 클래스를 작성한다.
Android 에서 XML parsing 하는 방법은 크게 3가지 종류가 있다.

네이버 검색 API를 이용한 어플리케이션을 구성하고 있는 주요 인터페이스 및 클래스는 다음과 같다.
* NewsFeedParser interface
* BaseNewsFeedParser abstract class
* RssHandler class
* SaxNewsFeedParser class
* AndroidSaxNewFeedParser class
* XMLPullNewsFeedParser class
* DomNewsFeedParser class

Android에서 XML 종류별로 XML parsing하는 내용을 살펴볼 것이다. 우선 XML 데이터를 parsing 하기 위한 interface를 정의한다. 3 가지 parser에서 공통으로 사용되어질 메소드를 interface 에서 미리 정의한다. 
이러한 설계 패턴을 *strategy pattern*이라고 한다.

```
package nscreen.searchinfo.news;
import java.util.List;
public interface NewsFeedParser {
        public List<News> parse();
}
```

BaseNewFeedParser는 서버와 접속하여, XML 데이터를 얻은 다음, InputStream으로 데이터를 받는 역할을 수행한다. 3 가지 parser가 XML 데이터를 받는 작업을 수행한다.

```
package nscreen.searchinfo.news;

import java.io.IOException;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.net.URL;
public abstract class BaseNewsFeedParser implements NewsFeedParser {
        
    final URL feedUrl;
    protected BaseNewsFeedParser(String feedUrl){
        try {
            this.feedUrl = new URL("feedUrl);
        } catch (MalformedURLException e) {
            throw new RuntimeException(e);
        }
    }
    protected InputStream getInputStream() {
        try {
            return feedUrl.openConnection().getInputStream();
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}

```

SAXParsing을 하기 위한 DefaultHandler 클래스를 상속받는 RssHandler 클래스를 정의한다.
XML 데이터를 받고 나서, XML 데이터를 처음부터 끝까지 데이터를 읽으면서 parsing 하는 작업을 수행한다.
News 목록을 저장하기 위한 NewsList 와 하나의 News 를 저장하기 위한 News 클래스, 그리고 문자열 작업을 위한 StringBuilder 클래스를 사용하여, XML 데이터를 parsing 한다.

```
package nscreen.searchinfo.news;

import java.util.ArrayList;
import java.util.List;
import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;
public class RssHandler extends DefaultHandler {
        private List<News> newsList;
        private News currentNews;
        private StringBuilder builder;
        public List<News> getNewsList(){
                return this.newsList;
        }
        
        @Override
        public void characters(char[] ch, int start, int length)
                        throws SAXException {
                super.characters(ch, start, length);
                builder.append(ch, start, length);
        }
        @Override
        public void endElement(String uri, String localName, String name)
                        throws SAXException {
                super.endElement(uri, localName, name);
                
                if (this.currentNews != null){
                        if (localName.equalsIgnoreCase(News.TITLE)){
                                currentNews.setTitle(builder.toString());
                        } else if (localName.equalsIgnoreCase(News.LINK)){
                                currentNews.setLink(builder.toString());
                        } else if (localName.equalsIgnoreCase(News.ORIGINAL_LINK)){
                                currentNews.setOriginalLink(builder.toString());
                        } else if (localName.equalsIgnoreCase(News.DESCRIPTION)){
                                currentNews.setDescription(builder.toString());
                        } else if (localName.equalsIgnoreCase(News.PUB_DATE)){
                                currentNews.setDate(builder.toString());
                        } else if (localName.equalsIgnoreCase(News.ITEM)){
                                newsList.add(currentNews);
                        }
                }
                builder.setLength(0);    
        }
        @Override
        public void startDocument() throws SAXException {
                super.startDocument();
                newsList = new ArrayList<News>();
                builder = new StringBuilder();
        }
        @Override
        public void startElement(String uri, String localName, String name,
                        Attributes attributes) throws SAXException {
                super.startElement(uri, localName, name, attributes);
                if (localName.equalsIgnoreCase(News.ITEM)){
                        this.currentNews = new News();
                }
        }
}
```


SaxNewsFeedParser 클래스는 SaxParser를 사용하여 XML 데이터를 parsing하는 클래스이다.

```
package nscreen.searchinfo.news;

import java.util.List;
import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;
public class SaxNewsFeedParser extends BaseNewsFeedParser {
        protected SaxNewsFeedParser(String feedUrl){
        super(feedUrl);
    }
   
    public List<News> parse() {
            
        SAXParserFactory factory = SAXParserFactory.newInstance();
       
        RssHandler handler = new RssHandler();
        try {
           
                SAXParser parser = factory.newSAXParser();
           
            parser.parse(this.getInputStream(), handler);
           
        } catch (Exception e) {
            e.printStackTrace();
        }
        return handler.getNewsList();
    }
}

```

AndroidSaxNewFeedParser 클래스는 Android에서 제공하는 Sax XML parser, Event 중심의 XML parser다.


```
package nscreen.searchinfo.news;

import java.util.ArrayList;
import java.util.List;
import android.sax.Element;
import android.sax.EndElementListener;
import android.sax.EndTextElementListener;
import android.sax.RootElement;
import android.util.Xml;
public class AndroidSaxNewsFeedParser extends BaseNewsFeedParser {
        static final String RSS = "rss";
        
        protected AndroidSaxNewsFeedParser(String feedUrl) {
                super(feedUrl);
        }
        public List<News> parse() {
                
                final News currentNews = new News();
                
                RootElement root = new RootElement(RSS);
                
                final List<News> newsList = new ArrayList<News>();
                
                Element channel = root.getChild(News.CHANNEL);
                
                Element item = channel.getChild(News.ITEM);
                item.setEndElementListener(new EndElementListener(){
                        public void end() {
                                newsList.add(currentNews.copy());
                        }
                });
                item.getChild(News.TITLE).setEndTextElementListener(new EndTextElementListener(){
                        public void end(String body) {
                                currentNews.setTitle(body);
                        }
                });
                item.getChild(News.LINK).setEndTextElementListener(new EndTextElementListener(){
                        public void end(String body) {
                                currentNews.setLink(body);
                        }
                });
                item.getChild(News.DESCRIPTION).setEndTextElementListener(new EndTextElementListener(){
                        public void end(String body) {
                                currentNews.setDescription(body);
                        }
                });
                item.getChild(News.PUB_DATE).setEndTextElementListener(new EndTextElementListener(){
                        public void end(String body) {
                                currentNews.setDate(body);
                        }
                });
                
                try {
                        Xml.parse(this.getInputStream(), Xml.Encoding.UTF_8, root.getContentHandler());
                } catch (Exception e) {
                        e.printStackTrace();
                }
                
                return newsList;
        }
}
```


XMLPullNewsFeedParser 클래스는 News 피드에 대한 pull parser다.

```
package nscreen.searchinfo.news;

import java.util.ArrayList;
import java.util.List;
import org.xmlpull.v1.XmlPullParser;
import android.util.Xml;
public class XmlPullNewsFeedParser extends BaseNewsFeedParser {
        protected XmlPullNewsFeedParser(String feedUrl) {
                super(feedUrl);
        }
        public List<News> parse() {
                
                List<News> NewsList = null;
                
                XmlPullParser parser = Xml.newPullParser();
                
                try {
                        
                        // auto-detect the encoding from the stream
                        parser.setInput(this.getInputStream(), null);
                        
                        int eventType = parser.getEventType();
                        
                        News currentNews = null;
                        
                        boolean done = false;
                        
                        while (eventType != XmlPullParser.END_DOCUMENT && !done){
                                
                                String name = null;
                                
                                switch (eventType){
                                
                                        case XmlPullParser.START_DOCUMENT:
                                                
                                                NewsList = new ArrayList<News>();
                                                break;
                                                
                                        case XmlPullParser.START_TAG:
                                                
                                                name = parser.getName();
                                                
                                                if (name.equalsIgnoreCase(News.ITEM)){
                                                        currentNews = new News();
                                                } else if (currentNews != null){
                                                        
                                                        if (name.equalsIgnoreCase(News.LINK)){
                                                                currentNews.setLink(parser.nextText());
                                                        } else if (name.equalsIgnoreCase(News.ORIGINAL_LINK)){
                                                                currentNews.setOriginalLink(parser.nextText());
                                                        } else if (name.equalsIgnoreCase(News.DESCRIPTION)){
                                                                currentNews.setDescription(parser.nextText());
                                                        } else if (name.equalsIgnoreCase(News.PUB_DATE)){
                                                                currentNews.setDate(parser.nextText());
                                                        } else if (name.equalsIgnoreCase(News.TITLE)){
                                                                currentNews.setTitle(parser.nextText());
                                                        }        
                                                }
                                                break;
                                                
                                        case XmlPullParser.END_TAG:
                                                
                                                name = parser.getName();
                                                
                                                if (name.equalsIgnoreCase(News.ITEM) && currentNews != null){
                                                        NewsList.add(currentNews);
                                                } else if (name.equalsIgnoreCase(News.CHANNEL)){
                                                        done = true;
                                                }
                                                break;
                                }
                                
                                eventType = parser.next();
                        }
                        
                } catch (Exception e) {
                        e.printStackTrace();
                }
                
                return NewsList;
        }
}

```

DomNewsFeedParser 클래스는 Dom으로 XML parsing을 수행하는 클래스다.

```
package com.coremodeling.naver.news;
import java.util.ArrayList;
import java.util.List;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
public class DomNewsFeedParser extends BaseNewsFeedParser {
        public DomNewsFeedParser(String feedUrl) {
                super(feedUrl);
        }
        public List<News> parse() {
                
                DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
                
                List<News> newsList = new ArrayList<News>();
                
                try {
                        
                        DocumentBuilder builder = factory.newDocumentBuilder();
                        Document dom = builder.parse(this.getInputStream());
                        
                        Element root = dom.getDocumentElement();
                        NodeList items = root.getElementsByTagName(News.ITEM);
                        
                        for (int i=0;i<items.getLength();i++){
                                
                                News news = new News();
                                
                                Node item = items.item(i);
                                
                                NodeList properties = item.getChildNodes();
                                
                                for (int j=0;j<properties.getLength();j++){
                                        
                                        Node property = properties.item(j);
                                        
                                        String name = property.getNodeName();
                                        
                                        if (name.equalsIgnoreCase(News.TITLE)){
                                                // 특수 문자로 인해서 텍스트가 여러개로 나뉘는 경우가 발생하여, 하나로 합친다.
                                                StringBuilder text = new StringBuilder();
                                                NodeList chars = property.getChildNodes();
                                                for (int k=0; k <chars.getLength(); k++){
                                                        text.append(chars.item(k).getNodeValue());
                                                }
                                                news.setTitle(text.toString());
                                        } else if (name.equalsIgnoreCase(News.LINK)){
                                                news.setLink(property.getFirstChild().getNodeValue());
                                        } else if (name.equalsIgnoreCase(News.ORIGINAL_LINK)){
                                                Node firstChild = property.getFirstChild();
                                                String originalLink = "";
                                                if (firstChild != null) {
                                                        originalLink = firstChild.getNodeValue();
                                                }
                                                news.setOriginalLink(originalLink);
                                        } else if (name.equalsIgnoreCase(News.DESCRIPTION)){
                                                news.setDescription(property.getFirstChild().getNodeValue());
                                        } else if (name.equalsIgnoreCase(News.PUB_DATE)){
                                                news.setDate(property.getFirstChild().getNodeValue());
                                        }
                                }
                                
                                newsList.add(news);
                        }
                        
                } catch (Exception e) {
                        e.printStackTrace();
                }
                
                return newsList;
        }
}

```


###화면 디자인

News 를 검색하고, 검색한 결과를 목록으로 화면에 나와야 하기 때문에, 검색하기 위한 입력창과 버튼, 그리고 목록을 처리할 수 있는 화면을 디자인한다.
아래와 같이 /res/layout/newslist.xml 파일을 생성하고, XML 파일을 디자인한다.


```
<?xml version="1.0" encoding="utf-8"?>
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
        android:orientation="vertical" android:layout_width="fill_parent"
        android:layout_height="fill_parent">
        <RelativeLayout android:layout_width="match_parent"
                android:layout_height="wrap_content" android:id="@+id/relativeLayout1">
                <Button android:layout_height="wrap_content" android:onClick="onClickSearch"
                        android:layout_width="wrap_content" android:text="검색" android:id="@+id/btnSearch"
                        android:layout_alignParentTop="true" android:layout_alignParentRight="true"></Button>
                <EditText android:layout_height="wrap_content"
                        android:layout_width="fill_parent" android:id="@+id/editSearch"
                        android:layout_toLeftOf="@id/btnSearch"
                        android:layout_alignParentTop="true" android:layout_alignParentLeft="true">
                        <requestFocus></requestFocus>
                </EditText>
        </RelativeLayout>
        <ListView android:layout_height="wrap_content" android:id="@android:id/list"
                android:layout_width="fill_parent"></ListView>
</LinearLayout>
```

그리고 목록의 각 행을 디자인하기 위한 XML 파일을 /res/layout/news_row.xml 파일을 생성하고 아래와 같이 디자인한다.

```
<?xml version="1.0" encoding="utf-8"?>
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
        android:orientation="vertical" android:layout_width="match_parent"
        android:layout_height="match_parent">
        <TextView android:layout_width="wrap_content" android:text="TextView"
                android:layout_height="wrap_content" android:id="@+id/textViewTitle"
                android:textAppearance="?android:attr/textAppearanceMedium"></TextView>
        <TextView android:text="TextView" android:id="@+id/textViewTime"
                android:layout_width="wrap_content" android:layout_height="wrap_content"></TextView>
</LinearLayout>
```

###Activity 구현

Activity 를 아래와 같이 구현한다.

```
package nscreen.searchinfo;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import android.app.ListActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.EditText;
import android.widget.SimpleAdapter;
import com.coremodeling.naver.news.News;
import com.coremodeling.naver.news.NewsFeedParser;
import com.coremodeling.naver.news.SaxNewsFeedParser;
public class NaverApiActivity extends ListActivity {
    /** Called when the activity is first created. */
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.newslist);
    }
   
    public void onClickSearch(View view) {
            loadData();
    }
   
    private void loadData() {
            
            String newsUrl = "http://openapi.naver.com/search?key=네이버검색키입력" +
                            "&target=news&start=1&display=20&query=";
            
            EditText editText = (EditText)findViewById(R.id.editSearch);
            
            String query = editText.getText().toString();
            
            NewsFeedParser newsFeedParser = new SaxNewsFeedParser(newsUrl + query);
            
            List<News> newsList = newsFeedParser.parse();
            
            List<Map<String, String>> xmlList = new ArrayList<Map<String,String>>();
            
            for (News news : newsList) {
                        
                    Map<String, String> newsMap = new HashMap<String, String>();
                    newsMap.put("title", news.getTitle());
                    newsMap.put("date", news.getDate());
                    
                    xmlList.add(newsMap);
                }
            
            String[] from = {"title", "date"};
            
            int[] to = {R.id.textViewTitle, R.id.textViewTime};
            
            SimpleAdapter simpleAdapter = new SimpleAdapter(this, xmlList, R.layout.news_row, from, to);
            
            setListAdapter(simpleAdapter);
            
    }
}

```

그리고 인터넷에 접근할 수 있는 권한을 사용하기 위해서, AndroidManifest.xml 파일에 INTERNET 을 use permission 으로 추가해야 한다.


```
<?xml version="1.0" encoding="utf-8"?>
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
      package="com.coremodeling.naver"
      android:versionCode="1"
      android:versionName="1.0">
    <uses-sdk android:minSdkVersion="10" />
    <uses-permission android:name="android.permission.INTERNET"></uses-permission>
    <application android:icon="@drawable/icon" android:label="@string/app_name">
        <activity android:name=".NaverApiActivity"
                  android:label="@string/app_name">
            <intent-filter>
                <action android:name="android.intent.action.MAIN" />
                <category android:name="android.intent.category.LAUNCHER" />
            </intent-filter>
        </activity>
    </application>
</manifest>
```

###실행 결과

아래와 같이 실행한 결과를 확인할 수 있다.


![http://sungsoo.github.com/images/result-app.png](http://sungsoo.github.com/images/result-app.png)


###References
[1] 안드로이드에서 네이버 News API 사용, [NaverNewFeed](http://www.coremodeling.com/android/tutorial/NaverNewsFeed/NaverNewsFeed.html), September, 2011.




























