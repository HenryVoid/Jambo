# Jambo

**Jambo** 기술 과제 전형에 제출하기 위한 레포지토리입니다. <br>
구현목표 기술에는 `API호출`, `페이징`, `카드본문표시`, `위치표기`, `시간표기`, `메시지표시` 가 있습니다.

## 기술 스택
- SwiftUI + TCA
- Swift Concurrency
- CoreLocation, OSLog

## 프로젝트 구조

| App | TCA |
| -- | -- |
| <img width="500" height="300" src="https://github.com/user-attachments/assets/2d2e1f4f-7226-4b33-a9d0-983fd56afa65"> | <img width="500" height="300" src="https://github.com/user-attachments/assets/fa14c47d-d53f-4d03-8615-98248b4bdea3"> |


## 화면 프리뷰

| 최초호출 | 페이징 | 카드본문 |
| -- | -- | -- |
| <video width="350" height="300" src="https://github.com/user-attachments/assets/c70b797d-8f09-446a-9ce9-103b1e7c11bb"> | <video width="350" height="300" src="https://github.com/user-attachments/assets/7d682ad1-8c99-41a2-a7d5-dfd816ce8fee"> | <video width="350" height="300" src="https://github.com/user-attachments/assets/a7568620-e8cd-4fcc-8b60-f4a8de8b6f29"> |


| 위치설정 O | 위치설정 X |
| -- | -- |
| <img width="150" height="300" src="https://github.com/user-attachments/assets/62bca5fb-c9b9-4bb4-9036-88403444f8a5"> | <img width="150" height="300" src="https://github.com/user-attachments/assets/d4fdabdb-74b4-4a78-93ec-0e459868118c"> |

## 추가 구현
기능 테스트를 통해 비즈니스 로직에 대한 안전성을 점검하였습니다. <br> 특히 Reducer(ViewModel)의 테스트커버리지는 100%에 가까워 아주 만족하였습니다. 😎

![testCoverage](https://github.com/user-attachments/assets/70f4ba2f-7bf1-4001-81b6-b47c6f1f7c06)

이미지를 보관하고 꺼내오는 것이 아닌 URL을 통해 이미지를 불러올 경우, Network 상태나 여러 요인들로 인해 실패할 경우가 있습니다.
그에 대비하기 위해 실패시 빈 이미지에 SkeletonAnimation효과를 주었습니다.

Error 상황별 Toast를 띄워 유저에게 경고하는 기능을 구현하였습니다. <br>
토스트가 여러개 떠도 유저가 놓치지않도록 중첩하여 나타납니다. 😎 <br><br>
![스크린샷 2025-01-26 오후 12 35 37](https://github.com/user-attachments/assets/08d3f125-48b7-4973-a6d6-967144da2d24)

## 후기 및 잡담
A형 독감에 걸려서 시간에 맞춰서 완성할 수 있을까 고민하였었는 데, <br> 평소 만들어두었던 Network 통신 관련 소스와 UI 컴포넌트가 시간단축에 많은 도움을 주었습니다. <br>
CoreLocation을 통해 위도,경도 불러내는 것부터 거리구하기까지 평소 안 해본 기능을 만들었는 데, 다행히 작동이 잘 되고 새로운 지식도 알게 되어 재밌었습니다. <br>
그리고 `시간표기`는 정말 빨리 구현하겠지? 하며 쉽게 생각했다가 코드를 여러 번 엎을 정도로, 좋은 코드가 무엇일 지 고민하게 되었습니다.

과제 전형을 진행하면서 가독성을 높이려면 어떻게 해야하지?, 내가 의도한 바가 구현 목표랑 다르면 어떡하지?, 조금 더 안전하게 작성할 수 있을까? 하며
고민을 많이 하게 되었다. 또, 내가 모르는 부분이 이렇게 많구나 하며 반성도 하게 되고, 여러모로 얻은 게 많은 것 같았다.
이렇게 성장할 수 있게 과제를 만들어준 `Jambo`의 고충이 많이 엿보였는데, 이런 회사라면 더더욱 가고 싶어지는 마음이 들 수 밖에 없었다.
