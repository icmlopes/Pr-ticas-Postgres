SELECT testimonials.id, "user1".name AS "writer", "user2".name AS "recipient", message 
FROM testimonials 
JOIN users "user1" 
    ON testimonials."writerId" = "user1".id 
JOIN users "user2"
    ON testimonials."recipientId" = "user2".id;