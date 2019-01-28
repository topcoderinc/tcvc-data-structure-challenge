def find(root, data)
    if data.nil?
        return nil
    elsif root.title == data
        return root
    end

    unless root.left.nil?
        answer = find(root.left, data)
        return answer unless answer == nil
    end

    unless root.right.nil?
        return find(root.right, data)
    end
    return nil
end

def find(root, search)
  return if root.nil? || search.nil?

  return root if root.title == search

  find(root.left, search) || find(root.right, search)
end
