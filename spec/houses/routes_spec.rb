require 'rails_helper'
describe 'Routes', type: :routing do
  describe 'usersController' do
    it 'routes get houses to index action' do
    expect(get: '/api/v1/houses').to route_to(
        controller: 'api/v1/houses',
        action: 'index'
      )
    end

    it 'routes post to houses create action' do
        expect(post: '/api/v1/houses').to route_to(
          controller: 'api/v1/houses',
          action: 'create'
        )
    end

    it 'route put to houses update with id' do
        expect(put: '/api/v1/houses/:id').to route_to(
          controller: 'api/v1/houses',
          action: 'update',
          id: ':id'
        )
    end

    it 'routes get with id to houses show action' do
        expect(get: '/api/v1/houses/:id').to route_to(
          controller: 'api/v1/houses',
          action: 'show',
          id: ':id'
        )
    end

    it 'routes delete request with id to houses delete action' do
        expect(DELETE: '/api/v1/houses/:id').to route_to(
          controller: 'api/v1/houses',
          action: 'destroy',
          id: ':id'
        )
    end
  end
end
