SELECT
    testimonials.id,
    writer.name AS writer,
    recipient.name AS recipient,
    testimonials.message
FROM testimonials
JOIN users writer ON testimonials."writerId" = writer.id
JOIN users recipient ON testimonials."recipientId" = recipient.id;