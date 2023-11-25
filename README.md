# Prompter-Day-Seoul-2023 팔로알토팀 


## 목차 
> - [👋 프로젝트 소개](#프로젝트-소개)
> - [📖 기획 의도](#기획-의도)
> - [💻 아키텍쳐](#아키텍쳐)
> - [📁 파일 구조](#파일-구조)
> - [🖥️ 기술 스택](#기술-스택)
> - [🔒 라이선스](#라이선스)


## 프로젝트 소개

|내용|설명|
|-----------|----|
|프로젝트 이름 |플랜트팔(PlantPal)| 
|한줄 소개 |식물을 키우는 즐거움과 안정감을 제공하며 사람과 자연을 함께 돕는 서비스.|
|개발 기간 |2023.08 - 2023.08(**약 1주일**)|


## 기획 의도

IT 와 데이터는 필수인 시장에서 초기 창업자의 딜레마
: 데이터 기반 비즈니스가 모든 제품의 기본이 된 시장에서 B2C 모바일 서비스를 시작하는
초기 사업자들은 다음과 같은 딜레마를 가지고 있다.

1) 개인화 모델은 이제 B2C IT 서비스 필수가 된 시대, 부담스러운 초기 비용
: 고객의 사용자 경험과 리텐션을 유지하기 위해서는 개인화 및 맞춤 컨텐츠가 B2C 앱의
사실상 필수 요소로 자리매김하게 되었다. 그러나 사람을 끌 수 있는 **개인화 서비스는 많은
데이터 리소스와 다각도의 모델 검증을 요구**하기에 인력과 자본이 충분한 기존
사업자들에게도 **관리 비용은 무거운 과제**로 다가온다.


2) 타겟 시장과 그에 맞는 서비스를 만들기 위한 높은 초기 리서치 및 인프라 비용
: 조금 더 초기 사업자들에게 초점을 맞추자면, 데이터 기반 맞춤 서비스 창업자의 경우,
이러한 비용 효율을 높이기 위해 가장 효과적인 타겟 시장을 고민하는 데에 더 집중하게 된다.
그러나 데이터 비즈니스는 고객을 만나기 전 어떤 가설을 세우냐에 따라 모델, 데이터, 
스토리지 준비 등 인프라와 인력 확보 방향성이 완전히 달라지고, 이 **방향성에 따라 비용의
수준도 극단적으로 달라질 수 있어서**, 신규 사업으로 리스크를 이미 크게 짊어지고 있는
상황에서 **비용에 대한 문제로 초기 창업자가 느끼는 부담감은 가중**된다.


3) 더 빨라진 시장, 더 짧아진 제품수명, 내게 필요한 건 속도
: 점점 더 트렌드의 수명주기가 짧아지고, 제품의 변화속도가 짧아지는 이 시점에, 시장을
빠르게 포착하는 만큼 중요한 것은 빠른 실행력이 시장 경쟁력이 되었다. 하지만 앞서 언급한
데이터 기반 서비스의 특성상 맞춤 서비스를 위한 비즈니스 준비 과정은 속도적인 면에서
한계가 존재한다.
이러한 상황들을 고려해 **가장 핫한 시장에 가장 빠르게 시장이 원하는 서비스가 가능한 구조**를
만드는 것에 주목했다.
**Prompt Engineering 을 기반**으로 일반적인 앱 구축과 운영방식을 제안해 보다 진일보된 사회에
기여할 수 있는 신생 서비스들이 더 다양하게 세상에 나올 수 있는 것을 목표로 아이디어를
구상했다. 우리 팀은 이번 해커톤에서 **Prompt-Only 로 고효율 저비용의 개인화 서비스를 시장에
출시**할 수 있도록 하는 비즈니스 운영 구조를 구상하고, 실제로 **1 주일도 채 되지 않는 단시간에
AI 가이드 앱 서비스 기능을 구현**하였다.




## 아키텍쳐
<img src="https://github.com/jhy0285/Prompter-day-seoul-2023/assets/89145559/f92fbfd8-871b-4489-af47-982128cf6eaa" width="90%"/>



## 파일 구조
```
📦src
 ┣ 📂main
 ┃ ┣ 📂java
 ┃ ┃ ┗ 📂com
 ┃ ┃ ┃ ┗ 📂kakao
 ┃ ┃ ┃ ┃ ┗ 📂linknamu
 ┃ ┃ ┃ ┃ ┃ ┣ 📂bookmark
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂controller
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂dto
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂validator
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂entity
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂repository
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂service
 ┃ ┃ ┃ ┃ ┃ ┣ 📂bookmarktag
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂controller
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂dto
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂entity
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂repository
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂service
 ┃ ┃ ┃ ┃ ┃ ┣ 📂category
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂controller
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂dto
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂entity
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂repository
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂service
 ┃ ┃ ┃ ┃ ┃ ┣ 📂core
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂config
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂dto
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂encryption
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂exception
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂log
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂redis
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂entity
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂repository
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂service
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂security
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📂util
 ┃ ┃ ┃ ┃ ┃ ┣ 📂kakao
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂controller
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂dto
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂service
 ┃ ┃ ┃ ┃ ┃ ┣ 📂share
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂controller
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂dto
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂category
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📂workspace
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📂service
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂category
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📂workspace
 ┃ ┃ ┃ ┃ ┃ ┣ 📂tag
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂entity
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂repository
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂service
 ┃ ┃ ┃ ┃ ┃ ┣ 📂thirdparty
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂googleDocs
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂controller
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂dto
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂entity
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂repository
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂service
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂util
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂notion
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂controller
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂dto
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂entity
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂repository
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂service
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂util
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📂utils
 ┃ ┃ ┃ ┃ ┃ ┣ 📂user
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂controller
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂dto
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂oauth
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂entity
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂constant
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂repository
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂service
 ┃ ┃ ┃ ┃ ┃ ┣ 📂workspace
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂controller
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂dto
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂entity
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂constant
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂repository
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂service
 ┃ ┗ 📂resources
```

## 기술 스택 
<img src="https://img.shields.io/badge/SpringBoot 3.13-120f0f?style=flat-square&logo=SpringBoot&logoColor=white" width="200" heigt="200"/>

<img src="https://img.shields.io/badge/SpringSecurity-120f0f?style=flat-square&logo=SpringSecurity&logoColor=white" width="200" heigt="200"/>

<img src="https://img.shields.io/badge/SpringDataJpa-120f0f?style=flat-square&logo=SpringBoot&logoColor=white" width="200" heigt="200"/>

<img src="https://img.shields.io/badge/Redis-120f0f?style=flat-square&logo=Redis&logoColor=white" width="110" heigt="200"/>

<img src="https://img.shields.io/badge/junit5-120f0f?style=flat-square&logo=junit5&logoColor=white" width="110" heigt="200"/>

<img src="https://img.shields.io/badge/MySql-120f0f?style=flat-square&logo=MySql&logoColor=white" width="110" heigt="200"/>

<img src="https://img.shields.io/badge/Docker-120f0f?style=flat-square&logo=Docker&logoColor=white" width="110" heigt="200"/>

<img src="https://img.shields.io/badge/QueryDSL-120f0f?style=flat-square&logo=SpringBoot&logoColor=white" width="140" heigt="200"/>

<img src="https://img.shields.io/badge/Kafka-120f0f?style=flat-square&logo=apachekafka&logoColor=white" width="140" heigt="200"/>




## 라이선스 

The MIT License (MIT)

Copyright (c) <year> <copyright holders>

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.




