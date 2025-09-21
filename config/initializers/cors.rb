Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    # Specify the origins that are allowed to make requests.
    # For development, you might use '*' to allow all origins,
    # but in production, you should specify the exact URLs of your frontend applications.
    origins "http://localhost:5173", "https://buyonegetone-react.onrender.com"

    # Specify the resources and allowed methods/headers.
    resource "*",
      headers: :any,
      methods: [ :get, :post, :put, :patch, :delete, :options, :head ]
  end
end
