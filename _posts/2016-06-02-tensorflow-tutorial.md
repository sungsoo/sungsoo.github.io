---
layout: post
title: TensorFlow Tutorial
date: 2016-06-02
categories: [computer science]
tags: [machine learning]

---


# TensorFlow Tutorial

## 소개
텐서플로우(TensorFlow)는 기계 학습과 딥러닝을 위해 구글에서 만든 오픈소스 라이브러리입니다. 데이터 플로우 그래프(Data Flow Graph) 방식을 사용하였습니다.

### 데이터 플로우 그래프

데이터 플로우 그래프는 수학 계산과 데이터의 흐름을 노드(Node)와 엣지(Edge)를 사용한 방향 그래프(Directed Graph)로 표현합니다.

![data flow graph](https://www.tensorflow.org/images/tensors_flowing.gif)

노드는 수학적 계산, 데이터 입/출력, 그리고 데이터의 읽기/저장 등의 작업을 수행합니다. 엣지는 노드들 간 데이터의 입출력 관계를 나타냅니다.

엣지는 동적 사이즈의 다차원 데이터 배열(=텐서)을 실어나르는데, 여기에서 텐서플로우라는 이름이 지어졌습니다.

> 텐서(Tensor)는 과학과 공학 등 다양한 분야에서 이전부터 쓰이던 개념입니다. 수학에서는 [임의의 기하 구조를 좌표 독립적으로 표현](http://ghebook.blogspot.kr/2011/06/tensor.html)하기 위한 표기법으로 알려져 있지만, 분야마다 조금씩 다른 의미로 사용됩니다. 여기에서는 *학습 데이터가 저장되는 다차원 배열* 정도로 이해하시면 되겠습니다.

### 특징

텐서플로우는 다음과 같은 특징을 가집니다:

- 데이터 플로우 그래프를 통한 풍부한 표현력
- 코드 수정 없이 CPU/GPU 모드로 동작
- 아이디어 테스트에서 서비스 단계까지 이용 가능
- 계산 구조와 목표 함수만 정의하면 자동으로 미분 계산을 처리 
- Python/C++를 지원하며, [SWIG](http://www.swig.org)를 통해 다양한 언어 지원 가능

*이후의 설명은 [Python](https://www.python.org)을 중심으로 진행하겠습니다.* (pip를 통한 Python3설치는 개발 중으로, Python2 기반으로 하겠습니다.)

> *"구글이 텐서플로우를 오픈소스로 한 것은, 기계 학습이 앞으로 제품과 기술을 혁신하는데 가장 필수적인 요소라고 믿기 때문입니다."      - Google Brain Team*

## 설치

텐서플로우는 설치가 비교적 쉬운 편입니다만, 다음과 같은 제약이 있습니다:

- Unix계열 OS(Linux/Mac OSX)만 지원합니다.
- GPU 버전은 Linux만 지원합니다.

### Linux / Mac OSX
Unix 계열 OS를 사용하시는 분들은 [공식 페이지의 설치 문서](https://www.tensorflow.org/versions/master/get_started/os_setup.html#download-and-setup)를 참고하시면 쉽게 설치할 수 있습니다.

### 윈도우
윈도우 사용자 분들은 가상 머신을 이용하거나, [도커 툴박스 설치](https://docs.docker.com/windows/) 후 진행하시기 바랍니다.

### 이미지를 받고 컨테이너 실행

텐서플로우의 도커 이미지는 소스코드, 예제, 툴도 포함되어 있기에 풀 버전을 받는 것을 권합니다.

#### Linux / Mac OSX
Unix 계열 OS에서는 아래의 명령을 실행하면 이미지를 받고 컨테이너가 실행됩니다. 컨테이너 실행 후 자동으로 컨테이너 안의 쉘 환경으로 들어가게 됩니다.

    docker run -it b.gcr.io/tensorflow/tensorflow-full

컨테이너 안의 `/tensorflow` 폴더에 소스가 설치되어 있습니다. (주의: 이 폴더에서 모듈을 import 하시면 에러가 발생합니다. )

#### 윈도우

윈도우의 경우 Docker QuickStart Terminal 실행 후(이때 고래 그림 아래의 IP를 기억해 둡니다) 아래와 같이 실행하시기 바랍니다.

    winpty docker run -it -p 8888:8888 b.gcr.io/tensorflow/tensorflow-full

이미지를 받은 후 컨테이너가 실행되면, Jupyter 노트북 서버가 자동으로 시작된 상태입니다. 웹브라우저에서 '위의IP:8888'을 입력하면 Jupyter Notebook 환경에 접속됩니다. 여기에서 tensorflow를 사용하실 수 있습니다.

### 동작 확인

설치가 잘 되었는지 다음의 코드로 확인해봅니다.

    $ python
    
    >>> import tensorflow as tf
    >>> hello = tf.constant('Hello, TensorFlow!')
    >>> sess = tf.Session()
    >>> print sess.run(hello)
    Hello, TensorFlow!
    >>> a = tf.constant(10)
    >>> b = tf.constant(32)
    >>> print sess.run(a+b)
    42
    >>>

## 기본 개념 익히기

일단 기본 용어부터 살펴보겠습니다.

### 용어
#### 오퍼레이션(Operation)
그래프 상의 노드는 오퍼레이션(줄임말 *op*)으로 불립니다. 오퍼레이션은 하나 이상의 *텐서*를 받을 수 있습니다. 오퍼레이션은 계산을 수행하고, 결과를 하나 이상의 텐서로 반환할 수 있습니다.

#### 텐서(Tensor)
내부적으로 모든 데이터는 텐서를 통해 표현됩니다. 텐서는 일종의 다차원 배열인데, 그래프 내의 오퍼레이션 간에는 텐서만이 전달됩니다. ([Caffe](http://caffe.berkeleyvision.org)의 [Blob](http://caffe.berkeleyvision.org/tutorial/net_layer_blob.html)과 유사합니다.)

#### 세션(Session)

그래프를 실행하기 위해서는 [세션](https://www.tensorflow.org/versions/master/api_docs/python/client.html#session-management) 객체가 필요합니다. 세션은 오퍼레이션의 실행 환경을 캡슐화한 것입니다.

#### 변수(Variables)
[변수](https://www.tensorflow.org/versions/master/how_tos/variables/index.html)는 그래프의 실행시, 패러미터를 저장하고 갱신하는데 사용됩니다. 메모리 상에서 텐서를 저장하는 버퍼 역할을 합니다.

### 예제

간단한 예제를 통해 기본 개념을 확인하겠습니다.

    import tensorflow as tf
    
    # 변수를 0으로 초기화
    state = tf.Variable(0, name="counter")
    
    # state에 1을 더할 오퍼레이션 생성
    one = tf.constant(1)
    new_value = tf.add(state, one)
    update = tf.assign(state, new_value)
    
    # 그래프는 처음에 변수를 초기화해야 합니다. 아래 함수를 통해 init 오퍼레이션을 만듭니다.   
    init_op = tf.initialize_all_variables()
    
    # 그래프를 띄우고 오퍼레이션들을 실행
    with tf.Session() as sess:
      # 초기화 오퍼레이션 실행
      sess.run(init_op)
      # state의 초기 값을 출력
      print(sess.run(state))
      # state를 갱신하는 오퍼레이션을 실행하고, state를 출력
      for _ in range(3):
        sess.run(update)
        print(sess.run(state))

결과

    0
    1
    2
    3

## 문제 풀이

이제 본격적으로 텐서플로우를 사용해 보겠습니다.

### 경사 하강법(Gradient Descent)으로 인자 찾아내기

아래의 예제는 가중치 행렬`W`와 바이어스`b`를 [경사하강법](https://ko.wikipedia.org/wiki/%EA%B2%BD%EC%82%AC_%ED%95%98%EA%B0%95%EB%B2%95)을 통해서 찾아내는 것을 보여줍니다. 목표값은 간단한 식으로 산출되도록 합니다.

    import tensorflow as tf
    import numpy as np
    
    # Numpy 랜덤으로 100개의 가짜 데이터 채우기. (float64 -> float32로 변환)
    x_data = np.float32(np.random.rand(2, 100))
    # 학습 레이블(목표값)은 아래의 식으로 산출. (W = [0.1, 0.2], b = 0.3)
    y_data = np.dot([0.100, 0.200], x_data) + 0.300

입력 데이터와 W, b를 사용해 선형 모델을 정의합니다.
    
    # b는 0,
    b = tf.Variable(tf.zeros([1]))
    # W는 1x2 형태의 웨이트 변수 (균등 랜덤값으로 초기화)
    W = tf.Variable(tf.random_uniform([1, 2], -1.0, 1.0))
    y = tf.matmul(W, x_data) + b
    
이제 손실과 학습 함수를 정의 합니다. [평균 제곱 오차](http://www.ktword.co.kr/abbr_view.php?m_temp1=3754)가 최소화 되는 지점을 경사하강법으로 구하게 됩니다.
    
    # 손실 함수 정의
    loss = tf.reduce_mean(tf.square(y - y_data))
    # 경사하강법으로 손실 함수를 최소화 (0.5는 학습 비율)
    optimizer = tf.train.GradientDescentOptimizer(0.5)
    # 학습 오퍼레이션 정의
    train = optimizer.minimize(loss)

학습 세션을 시작합니다.
    
    # 모든 변수를 초기화.
    init = tf.initialize_all_variables()
    
    # 세션 시작
    sess = tf.Session()
    sess.run(init)
    
    # 200번 학습.
    for step in xrange(0, 201):
        sess.run(train)
        if step % 20 == 0:
            print step, sess.run(W), sess.run(b)
    
결과는 다음과 같습니다.

    0 [[ 0.8228116   0.25179306]] [-0.21591029]
    20 [[ 0.31065419  0.22789511]] [ 0.17903577]
    40 [[ 0.15808699  0.20829338]] [ 0.26633102]
    60 [[ 0.11601268  0.20247138]] [ 0.29062203]
    80 [[ 0.10441278  0.20073807]] [ 0.2973859]
    100 [[ 0.10121564  0.20022091]] [ 0.29927069]
    120 [[ 0.10033476  0.20006624]] [ 0.29979634]
    140 [[ 0.10009213  0.20001991]] [ 0.29994306]
    160 [[ 0.10002533  0.20000601]] [ 0.29998407]
    180 [[ 0.10000696  0.20000178]] [ 0.29999554]
    200 [[ 0.10000192  0.20000054]] [ 0.29999873]    

처음에 설정한 `W`와 `b`를 훌륭히 찾아냈습니다. 어떠신가요? 개인적인 느낌은 코드가 깔끔한 것 같습니다. 텐서플로우는 기존에 나와있는 딥러닝 프레임워크에 비해 단순하면서도 표현력이 풍부합니다.

텐서플로에 대해 좀 더 자세히 살펴보기 위해 MNIST 예제를 보겠습니다.  (자세한 설명은 [MNIST 예제 페이지](http://www.tensorflow.org/tutorials/mnist/beginners/index.md)를 참고하세요.)

### MNIST

[MNIST](http://yann.lecun.com/exdb/mnist/)는 아래와 같이 손으로 쓴 숫자의 이미지 데이터베이스입니다. 이 데이터를 학습하여 분류기를 만드는 예제입니다.
![mnist](https://www.tensorflow.org/versions/master/images/MNIST.png)

먼저 필요한 데이터를 받아주는 `input_data`모듈을 설치합니다.

    $ wget https://gist.githubusercontent.com/haje01/14b0e5d8bd5428df781e/raw/5b6d04c55f30191a0e32d0ae627716413c808c1c/input_data.py

Python을 실행하고 아래와 같이 데이터를 가져옵니다.

    # MNIST 데이터 가져옴
    import input_data
    mnist = input_data.read_data_sets("MNIST_data/", one_hot=True)

MNIST의 레이블은 0~9의 값이지만, 이것은 연속된 숫자가 아닌 카테고리 값입니다. 따라서 [One-Hot](https://en.wikipedia.org/wiki/One-hot) Encoding이 필요합니다. 5는 [0, 0, 0, 0, 0, 1, 0, 0, 0, 0], 0은 [1, 0, 0, 0, 0, 0, 0, 0, 0, 0] 식으로 됩니다.

![enter image description here](https://www.tensorflow.org/versions/master/images/mnist-train-ys.png)

MNIST에는 55,000개의 학습용 이미지 + 10,000개의 테스트 이미지 + 5,000개의 검증 이미지가 있습니다. 각 이미지는 28x28 크기를 가집니다.  이것을 펼치면 784 차원의 벡터가 됩니다. 

`read_data_sets`에서 반환되는 값은 `mnist.train.image` 타입의 [55000, 784] 크기의 텐서입니다.

![enter image description here](https://www.tensorflow.org/versions/master/images/mnist-train-xs.png)
    
펼쳐지면서 2D 이미지의 구조적 정보는 사라지지만, 우리가 사용할 간단한 메소드(=Softmax)에서는 문제가 되지 않습니다.
    
    import tensorflow as tf
    
    # 이미지 데이터 플레이스홀더
    x = tf.placeholder("float", [None, 784])

`x`는 2D 텐서를 위한 [플레이스 홀더(Placeholder)](https://www.tensorflow.org/versions/master/api_docs/python/io_ops.html#placeholders)인데, 이곳에 데이터가 채워지게 됩니다. `None`은 행의 수가 한정되지 않는다는 뜻입니다.

가중치와 바이어스 변수는 기본값 0으로 채웁니다. 이 변수들에 학습의 결과가 저장됩니다. `W`는 [784, 10]의 행태를 가지는데, 이것은 784차원의 이미지 벡터를 곱해, 10차원(인코딩된 0~9)의 결과를 내기 위한 것입니다. `b`는 결과에 더하기 위해 10차원이 됩니다.
        
    # 웨이트와 바이어스 변수
    W = tf.Variable(tf.zeros([784,10]))
    b = tf.Variable(tf.zeros([10]))

모델은 한 줄로 간단히 정의됩니다. 액티베이션 함수는 [소프트맥스(Softmax)](https://en.wikipedia.org/wiki/Softmax_function)를 사용합니다. `x`와 `W`의 위치가 바뀐 것은 `x`를 확장 가능한 입력을 가지는 2D텐서로 하기 위해서입니다. (행렬 곱의 순서가 바뀐 부분이 걸리는데, 이 상태로 학습이 진행되어 도출될 행렬이기에 문제가 없다고 생각됩니다.)
    
    # 모델 구현
    y = tf.nn.softmax(tf.matmul(x,W) + b)
    
    # 정답 레이블용 플레이스 홀더
    y_ = tf.placeholder("float", [None,10])

y_에 학습용 정답이 채워집니다. 손실 함수는 정보 이론의 [크로스 엔트로피(Cross-Entropy)](https://en.wikipedia.org/wiki/Cross_entropy) 방식으로 정의합니다.
    
    # Loss 함수
    cross_entropy = -tf.reduce_sum(y_*tf.log(y))

이 함수는 하나의 예측에 대한 것이 아니라 한 배치(Batch)내 모든 예측의 로스를 더한 것입니다. 

이제 텐서플로우는 우리 모델이 어떤 동작을 해야하는지 알기에, [역전파 방법(Backpropagation)](https://en.wikipedia.org/wiki/Backpropagation)을 통해 변수를 결정할 수 있습니다. 경사하강법에 0.01의 학습률로 최적화기(Optimizer)를 만들고, 그것을 통해 손실을 최소화하도록 학습 오퍼레이션을 정의합니다.
    
    # 학습 오퍼레이션
    train_step = tf.train.GradientDescentOptimizer(0.01).minimize(cross_entropy)

세션 시작 전에 변수를 초기화 하고,

    # 모든 변수 초기화
    init = tf.initialize_all_variables()
    
    sess = tf.Session()
    sess.run(init)

스텝 당 100개 단위로 샘플링하여 1000번 진행합니다. 
    
    # 임의로 100개 샘플링
    for i in range(1000):
      batch_xs, batch_ys = mnist.train.next_batch(100)
      sess.run(train_step, feed_dict={x: batch_xs, y_: batch_ys})

샘플링된 데이터는 `feed_dict` 인자를 참고해서 플레이스 홀더에 공급됩니다. 이렇게 랜덤한 작은 배치로 학습 하는 것을 *스토캐스틱 학습(Stochastic Training)*이라고 합니다. 비용이 싸고 결과는 비슷합니다.

이제 계산된 레이블들 중 가장 점수가 높은 것을 선택합니다. 아래에 나오는 `tf.argmax`함수는 텐서 내의 지정된 축에서 가장 높은 값의 인덱스를 반환합니다. 

`tf.equal`에서는 예측 값과 정답이 같으면 `True` 아니면 `False` 값이 반환되는데, 이것을 `float`형으로 바꾸고 평균을 계산해 정확도를 구합니다. *정확도는 학습 데이터가 아닌 테스트 데이터를 사용해야합니다.*

    # 정답율
    correct_prediction = tf.equal(tf.argmax(y,1), tf.argmax(y_,1))
    accuracy = tf.reduce_mean(tf.cast(correct_prediction, "float"))
    
    print sess.run(accuracy, feed_dict={x: mnist.test.images, y_: mnist.test.labels})

출력

    0.9155

돌려보면 91% 정도의 정확도가 나옵니다. 좀 더 개선이 필요하겠지만, 이렇게 짧은 코드로 MNIST 학습을 구현한 것은 놀랍습니다.

## 마무리

### Tensor Board

텐서플로우를 사용해서 딥뉴럴 넷 같은 복잡한 계산을 할 때는 학습 과정이 복잡하고 이해하기 힘들 때가 있습니다. 이럴 때는 [텐서 보드](https://www.tensorflow.org/versions/master/how_tos/summaries_and_tensorboard/index.html)를 사용하면 복잡한 학습 과정을 시각화하여 볼 수 있습니다. 

![tensor board](https://www.tensorflow.org/versions/master/images/mnist_tensorboard.png)

