import UIKit

Task{
    let url=URL(string:"https://gvec03gvkf.execute-api.ap-northeast-2.amazonaws.com/")!  //1번방법

    let (data, _) = try! await URLSession.shared.data(from:url) //오류 해결방법 1. 위에 !붙여주기 2.Task로 감싸주기
    //링크에 접속하려면 무조건 URLSession을 써야함. 링크같은것임(shared는 거의 무조건 같이쓰고, 빼올게 data니까 data까지 붙여줌)
    //data에 옵션키 해보면 받는 형식이 (Data, URLResponse)인데, URLResponse는 메타데이터 같은 정보를 담고 있어서 안받고 data만 받기 때문에 (data, _)
    //data에 옵션키 해보면 throw가 있는데 에러를 일으킬 수 있다는 뜻이고 에러를 일으키는 함수는 무조건 try로 받아야함
    //await는 오래걸릴수 있다는 표시, data에 옵션키 해보면 await가 있는데 비동기적으로 실행이 된다는 뜻
    
    print("data", data)
    let jsonString = String(data: data, encoding: .utf8)    //utf8은 컴퓨터가 읽을수 있는 data를 인간이 읽을수 있는 유니코드로 바꿔주는 것
    print(jsonString)
}
