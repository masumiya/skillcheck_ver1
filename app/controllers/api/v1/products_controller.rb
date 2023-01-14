# frozen_string_literal: true

module Api
  module V1
    class ProductsController < ApplicationController
      def index
        @products = Product.order(created_at: :desc).eager_load(:variants)

        render json: result_json, include: [:variants], status: :ok
      end

      private

      def result_json
        {
           data:  { products: @products }
        }
      end
    end
  end
end
