require "test_helper"

describe CategoriesController do
  describe "authenticated user" do

    describe "index" do

    end

    describe "new" do

    end

    describe "create" do

    end

    describe "show" do

    end

    describe "edit" do

    end

    describe "update" do

    end

    describe "destroy" do

    end

  end

  describe "guest user" do
    it "rejects requests for new category form" do
      get new_category_path
      must_respond_with :unauthorized
    end

    it "rejects requests to create a category" do
      category_data = {
        name: "Test Category"
      }

      old_category_count = Category.count
      Category.new(category_data).must_be :valid?

      post categories_path, params: { category: category_data }

      must_respond_with :unauthorized
      Category.count.must_equal old_category_count
    end

    it "rejects requests for edit category form" do
      get edit_category_path(Category.first)
      must_respond_with :unauthorized
    end

    it "rejects requests to update a category" do
      category = Category.first
      category_data = category.attributes
      category_data[:name] = "updated category name"

      category.assign_attributes(category_data)
      category.must_be :valid?

      patch category_path(category), params: { category: category_data }

      must_respond_with :unauthorized
    end

    it "rejects requests to delete a category" do
      category_id = Category.first.id
      old_category_count = Category.count

      delete category_path(category_id)

      must_respond_with :unauthorized
      Category.count.must_equal old_category_count
    end
  end

end
