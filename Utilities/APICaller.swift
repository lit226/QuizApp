import Foundation

class APICaller {
    static let shared = APICaller()

    private init() {}

    // MARK: - Fetching APIs

    public func fetchGKEasyQuestion(completion: @escaping (Result<[Results], Error>) ->Void) {
        guard let url = NSURL(string: "https://opentdb.com/api.php?amount=10&category=9&difficulty=easy&type=multiple") as? URL else {
            assertionFailure("Failed to convert to url")
            return
        }

        let request = NSMutableURLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        request.httpMethod = "GET"

        let session = URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
            guard let data = data, error == nil else {
                print("Either data was not taken or error is not nil")
                return
            }

            do {
                let result = try JSONDecoder().decode(ServerResponse.self, from: data)
                completion(.success(result.results))
            } catch {
                completion(.failure(error))
            }
        })

        session.resume()
    }

    public func fetchGKMediumQuestion(completion: @escaping (Result<[Results], Error>) ->Void) {
        guard let url = NSURL(string: "https://opentdb.com/api.php?amount=10&category=9&difficulty=medium&type=multiple") as? URL else {
            assertionFailure("Failed to convert to url")
            return
        }

        let request = NSMutableURLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        request.httpMethod = "GET"

        let session = URLSession.shared.dataTask(with: request as URLRequest) { data, response, error in
            guard let data = data, error == nil else {
                print("Either data was not taken or error is not nil")
                return
            }

            do {
                let result = try JSONDecoder().decode(ServerResponse.self, from: data)
                completion(.success(result.results))
            } catch {
                completion(.failure(error))
            }
        }

        session.resume()
    }

    public func fetchGKHardQuestion(completion: @escaping (Result<[Results], Error>) ->Void) {
        guard let url = NSURL(string: "https://opentdb.com/api.php?amount=10&category=9&difficulty=hard&type=multiple") as? URL else {
            assertionFailure("Failed to convert to url")
            return
        }

        let request = NSMutableURLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        request.httpMethod = "GET"

        let session = URLSession.shared.dataTask(with: request as URLRequest) { data, response, error in
            guard let data = data, error == nil else {
                print("Either data was not taken or error is not nil")
                return
            }

            do {
                let result = try JSONDecoder().decode(ServerResponse.self, from: data)
                completion(.success(result.results))
            } catch {
                completion(.failure(error))
            }
        }

        session.resume()
    }

    public func fetchEntertainmenteEasyQuestion(completion: @escaping (Result<[Results], Error>) ->Void) {
        guard let url = NSURL(string: "https://opentdb.com/api.php?amount=10&category=11&difficulty=easy&type=multiple") as? URL else {
            assertionFailure("Failed to convert to url")
            return
        }

        let request = NSMutableURLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        request.httpMethod = "GET"

        let session = URLSession.shared.dataTask(with: request as URLRequest) { data, response, error in
            guard let data = data, error == nil else {
                print("Either data was not taken or error is not nil")
                return
            }

            do {
                let result = try JSONDecoder().decode(ServerResponse.self, from: data)
                completion(.success(result.results))
            } catch {
                completion(.failure(error))
            }
        }

        session.resume()
    }

    public func fetchEntertainmenteMediumQuestion(completion: @escaping (Result<[Results], Error>) ->Void) {
        guard let url = NSURL(string: "https://opentdb.com/api.php?amount=10&category=11&difficulty=medium&type=multiple") as? URL else {
            assertionFailure("Failed to convert to url")
            return
        }

        let request = NSMutableURLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        request.httpMethod = "GET"

        let session = URLSession.shared.dataTask(with: request as URLRequest) { data, response, error in
            guard let data = data, error == nil else {
                print("Either data was not taken or error is not nil")
                return
            }

            do {
                let result = try JSONDecoder().decode(ServerResponse.self, from: data)
                completion(.success(result.results))
            } catch {
                completion(.failure(error))
            }
        }

        session.resume()
    }

    public func fetchEntertainmenteHardQuestion(completion: @escaping (Result<[Results], Error>) ->Void) {
        guard let url = NSURL(string: "https://opentdb.com/api.php?amount=10&category=11&difficulty=hard&type=multiple") as? URL else {
            assertionFailure("Failed to convert to url")
            return
        }

        let request = NSMutableURLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        request.httpMethod = "GET"

        let session = URLSession.shared.dataTask(with: request as URLRequest) { data, response, error in
            guard let data = data, error == nil else {
                print("Either data was not taken or error is not nil")
                return
            }

            do {
                let result = try JSONDecoder().decode(ServerResponse.self, from: data)
                completion(.success(result.results))
            } catch {
                completion(.failure(error))
            }
        }

        session.resume()
    }

    public func fetchScienceEasyQuestion(completion: @escaping (Result<[Results], Error>) ->Void) {
        guard let url = NSURL(string: "https://opentdb.com/api.php?amount=10&category=18&difficulty=easy&type=multiple") as? URL else {
            assertionFailure("Failed to convert to url")
            return
        }

        let request = NSMutableURLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        request.httpMethod = "GET"

        let session = URLSession.shared.dataTask(with: request as URLRequest) { data, response, error in
            guard let data = data, error == nil else {
                print("Either data was not taken or error is not nil")
                return
            }

            do {
                let result = try JSONDecoder().decode(ServerResponse.self, from: data)
                completion(.success(result.results))
            } catch {
                completion(.failure(error))
            }
        }

        session.resume()
    }

    public func fetchScienceMediumQuestion(completion: @escaping (Result<[Results], Error>) ->Void) {
        guard let url = NSURL(string: "https://opentdb.com/api.php?amount=10&category=18&difficulty=medium&type=multiple") as? URL else {
            assertionFailure("Failed to convert to url")
            return
        }

        let request = NSMutableURLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        request.httpMethod = "GET"

        let session = URLSession.shared.dataTask(with: request as URLRequest) { data, response, error in
            guard let data = data, error == nil else {
                print("Either data was not taken or error is not nil")
                return
            }

            do {
                let result = try JSONDecoder().decode(ServerResponse.self, from: data)
                completion(.success(result.results))
            } catch {
                completion(.failure(error))
            }
        }

        session.resume()
    }

    public func fetchScienceHardQuestion(completion: @escaping (Result<[Results], Error>) ->Void) {
        guard let url = NSURL(string: "https://opentdb.com/api.php?amount=10&category=18&difficulty=hard&type=multiple") as? URL else {
            assertionFailure("Failed to convert to url")
            return
        }

        let request = NSMutableURLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        request.httpMethod = "GET"

        let session = URLSession.shared.dataTask(with: request as URLRequest) { data, response, error in
            guard let data = data, error == nil else {
                print("Either data was not taken or error is not nil")
                return
            }

            do {
                let result = try JSONDecoder().decode(ServerResponse.self, from: data)
                completion(.success(result.results))
            } catch {
                completion(.failure(error))
            }
        }

        session.resume()
    }

    public func fetchSportsEasyQuestion(completion: @escaping (Result<[Results], Error>) ->Void) {
        guard let url = NSURL(string: "https://opentdb.com/api.php?amount=10&category=21&difficulty=easy&type=multiple") as? URL else {
            assertionFailure("Failed to convert to url")
            return
        }

        let request = NSMutableURLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        request.httpMethod = "GET"

        let session = URLSession.shared.dataTask(with: request as URLRequest) { data, response, error in
            guard let data = data, error == nil else {
                print("Either data was not taken or error is not nil")
                return
            }

            do {
                let result = try JSONDecoder().decode(ServerResponse.self, from: data)
                completion(.success(result.results))
            } catch {
                completion(.failure(error))
            }
        }

        session.resume()
    }

    public func fetchSportsMediumQuestion(completion: @escaping (Result<[Results], Error>) ->Void) {
        guard let url = NSURL(string: "https://opentdb.com/api.php?amount=10&category=21&difficulty=medium&type=multiple") as? URL else {
            assertionFailure("Failed to convert to url")
            return
        }

        let request = NSMutableURLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        request.httpMethod = "GET"

        let session = URLSession.shared.dataTask(with: request as URLRequest) { data, response, error in
            guard let data = data, error == nil else {
                print("Either data was not taken or error is not nil")
                return
            }

            do {
                let result = try JSONDecoder().decode(ServerResponse.self, from: data)
                completion(.success(result.results))
            } catch {
                completion(.failure(error))
            }
        }

        session.resume()
    }

    public func fetchSportsHardQuestion(completion: @escaping (Result<[Results], Error>) ->Void) {
        guard let url = NSURL(string: "https://opentdb.com/api.php?amount=10&category=21&difficulty=hard&type=multiple") as? URL else {
            assertionFailure("Failed to convert to url")
            return
        }

        let request = NSMutableURLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        request.httpMethod = "GET"

        let session = URLSession.shared.dataTask(with: request as URLRequest) { data, response, error in
            guard let data = data, error == nil else {
                print("Either data was not taken or error is not nil")
                return
            }

            do {
                let result = try JSONDecoder().decode(ServerResponse.self, from: data)
                completion(.success(result.results))
            } catch {
                completion(.failure(error))
            }
        }

        session.resume()
    }

    public func fetchMythEasyQuestion(completion: @escaping (Result<[Results], Error>) ->Void) {
        guard let url = NSURL(string: "https://opentdb.com/api.php?amount=10&category=20&difficulty=easy&type=multiple") as? URL else {
            assertionFailure("Failed to convert to url")
            return
        }

        let request = NSMutableURLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        request.httpMethod = "GET"

        let session = URLSession.shared.dataTask(with: request as URLRequest) { data, response, error in
            guard let data = data, error == nil else {
                print("Either data was not taken or error is not nil")
                return
            }

            do {
                let result = try JSONDecoder().decode(ServerResponse.self, from: data)
                completion(.success(result.results))
            } catch {
                completion(.failure(error))
            }
        }

        session.resume()
    }

    public func fetchMythMediumQuestion(completion: @escaping (Result<[Results], Error>) ->Void) {
        guard let url = NSURL(string: "https://opentdb.com/api.php?amount=10&category=20&difficulty=medium&type=multiple") as? URL else {
            assertionFailure("Failed to convert to url")
            return
        }

        let request = NSMutableURLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        request.httpMethod = "GET"

        let session = URLSession.shared.dataTask(with: request as URLRequest) { data, response, error in
            guard let data = data, error == nil else {
                print("Either data was not taken or error is not nil")
                return
            }

            do {
                let result = try JSONDecoder().decode(ServerResponse.self, from: data)
                completion(.success(result.results))
            } catch {
                completion(.failure(error))
            }
        }

        session.resume()
    }

    public func fetchMythHardQuestion(completion: @escaping (Result<[Results], Error>) ->Void) {
        guard let url = NSURL(string: "https://opentdb.com/api.php?amount=10&category=20&difficulty=hard&type=multiple") as? URL else {
            assertionFailure("Failed to convert to url")
            return
        }

        let request = NSMutableURLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        request.httpMethod = "GET"

        let session = URLSession.shared.dataTask(with: request as URLRequest) { data, response, error in
            guard let data = data, error == nil else {
                print("Either data was not taken or error is not nil")
                return
            }

            do {
                let result = try JSONDecoder().decode(ServerResponse.self, from: data)
                completion(.success(result.results))
            } catch {
                completion(.failure(error))
            }
        }

        session.resume()
    }

}
