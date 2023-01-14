# frozen_string_literal: true

module Api
  module V1
    class ProductsController < ApplicationController
      def index
        @products = Product.order(created_at: :desc)
        render json: result_json
      end

      private

      def result_json
        {
          data: { products: products_json }
        }
      end

      def products_json
        @products.map do |product|
          {
            id: product.id,
            variants: variants_json(product)
          }
        end
      end

      def variants_json(product)
        variants = Variant.where(product: product).order(created_at: :desc)
        variants.map do |variant|
          {
            id: variant.id
          }
        end
      end
    end
  end
end
