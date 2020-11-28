json.id house.id
json.slug house.slug
json.name house.name

json.body do
    json.country house.country
    json.address house.address
    json.status house.status
    json.region house.region
    json.location house.location
    json.image house.image
    json.user house.user_id
end

json.dates do
    json.created_at house.created_at
    json.updated_at house.updated_at
end
