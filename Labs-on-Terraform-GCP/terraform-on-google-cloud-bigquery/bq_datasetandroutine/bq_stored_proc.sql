SELECT 
  -- Basic fields
  id,
  created_at,
  updated_at,
  user_id,
  user_name,
  email,
  age,
  is_active,
  account_balance,
  last_login_date,
  registration_datetime,
  
  -- Profile fields (RECORD - direct access)
  profile.first_name,
  profile.last_name,
  profile.phone,
  profile.address.street,
  profile.address.city,
  profile.address.state,
  profile.address.zip_code,
  profile.address.country,
  
  -- Order fields (from UNNEST)
  order_data.order_id,
  order_data.order_date,
  order_data.total_amount,
  order_data.currency,
  order_data.status,
  
  -- Order item fields (from nested UNNEST)
  order_item.product_id,
  order_item.product_name,
  order_item.quantity,
  order_item.unit_price,
  order_item.discount,
  
  -- Array fields (kept as arrays)
  preferences,
  tags,
  
  -- Other fields
  metadata,
  score,
  large_number,
  raw_data,
  geographic_location

FROM `${project_id}.${dataset_id}.${table_id}`
LEFT JOIN UNNEST(orders) AS order_data
LEFT JOIN UNNEST(order_data.items) AS order_item;