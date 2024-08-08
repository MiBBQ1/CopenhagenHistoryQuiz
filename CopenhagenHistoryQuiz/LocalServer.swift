import Foundation
import Swifter

class LocalServer {
    static let shared = LocalServer()
    private let server = HttpServer()

    func start() {
        server["/api/v1/attribution"] = { request in
            let body = Data(request.body)
            print("Received body: \(String(data: body, encoding: .utf8) ?? "Invalid body")")
            
            guard let jsonObject = try? JSONSerialization.jsonObject(with: body),
                  let dict = jsonObject as? [String: Any],
                  let token = dict["token"] as? String else {
                print("Invalid JSON or missing token")
                return .badRequest(nil)
            }

            let url = URL(string: "https://api-adservices.apple.com/api/v1/")!
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = "POST"
            urlRequest.setValue("text/plain", forHTTPHeaderField: "Content-Type")
            urlRequest.httpBody = token.data(using: .utf8)

            print("Sending request to URL: \(url)")
            print("Request body: \(String(data: urlRequest.httpBody ?? Data(), encoding: .utf8) ?? "Invalid body")")

            let semaphore = DispatchSemaphore(value: 0)
            var responseData: Data?
            var responseError: Error?
            var responseCode: Int?

            let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
                if let httpResponse = response as? HTTPURLResponse {
                    responseCode = httpResponse.statusCode
                    print("HTTP Status Code: \(httpResponse.statusCode)")
                    print("HTTP Headers: \(httpResponse.allHeaderFields)")
                }
                responseData = data
                responseError = error
                semaphore.signal()
            }
            task.resume()
            semaphore.wait()

            if let error = responseError {
                print("Error in network request: \(error)")
                return .internalServerError
            } else if let data = responseData {
                print("Received data: \(String(data: data, encoding: .utf8) ?? "Invalid data")")
                return .ok(.data(data))
            } else {
                print("No data received")
                return .internalServerError
            }
        }

        do {
            try server.start(8080)
            print("Server started on port 8080")
        } catch {
            print("Server start error: \(error)")
        }
    }
}
