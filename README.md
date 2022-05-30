# -graphqlmesh-many-to-many-relations
Just bring up Docker with

` docker-compose up -d ` 

then 

` yarn install ` 
` yarn graphql-mesh dev`


### Target Query design

```graphql
query MyQuery {
  articles {
    content
    id
    title
    categories {
      title
    }
  }
}
```
