module Posts
  class Index < SitePrism::Page
    include Formulaic::Dsl
    include FactoryGirl::Syntax::Methods

    set_url '/'

  end
end
